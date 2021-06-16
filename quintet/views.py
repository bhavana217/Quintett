from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from string import Template

from django.contrib import messages, auth
from django.http import HttpResponse, HttpResponseRedirect
from fpdf import FPDF
import mysql
import smtplib
from datetime import datetime, timedelta

from django.shortcuts import render, redirect
from quintet.forms import UsersForm1, TrainerForm, CollegeForm
from quintet.models import Users, Trainers, Admin, college
from mysql.connector import Error
from django.contrib.auth import authenticate


def home(requests):
    # return HttpResponse("Hello World")
    return render(requests, "home.html")


def login(requests):
    return render(requests, "login.html")


def read_template(filename):
    with open(filename, 'r', encoding='utf-8') as template_file:
        template_file_content = template_file.read()
    return Template(template_file_content)


def generate(request, domain, startdate, enddate):
    print("got in generate")
    if request.method == 'POST':
        print("got post")
        trainer = Trainers.objects.get(domain=domain)
        trainer_name = trainer.name
        college_id = request.POST['collegename']
        colleges = college.objects.get(collegeid=college_id)
        college_name = colleges.collegename
        remuneration = str(trainer.fees)
        acc_no = trainer.bank_acc_number
        pan = trainer.Pan
        ifsc = trainer.IFSC
        email = trainer.emailid
        location = trainer.Location
        start_date = startdate
        end_date = enddate
        training = request.POST['training']
        duration = request.POST['duration']

        edate = datetime.strptime(end_date, '%Y-%m-%d')
        sdate = datetime.strptime(start_date, '%Y-%m-%d')
        no = edate - sdate
        no_days = no.days
        food = request.POST['food']
        if training == 'Offline':
            travel = int(request.POST['travel'])
        else:
            travel = 0
        if request.POST['food'] == 'Yes' and training == 'Offline':
            food = '500'
        else:
            food = '0'

        email_generator(request, trainer_name, remuneration, college_name, college_id, acc_no,
                        ifsc, pan, email, location, no_days, sdate, edate,
                        start_date, end_date, travel, food, training, duration)
    else:
        print("got get")
        return HttpResponse("no get request allowed")


def email_generator(request, trainer_name, remuneration, college_name, college_id, acc_no,
                    ifsc, pan, email, location, no_days, sdate, edate, start_date,
                    end_date, travel, food, training, duration):
    # set up the SMTP server
    s = smtplib.SMTP(host='smtp.gmail.com', port=587)
    s.starttls()
    s.login("quintet273@gmail.com", "Quintet123")
    msg = MIMEMultipart()  # create a message
    # add in the actual person name to the message template

    message = "Greetings from Quintet!!\n" \
              "This is an email confirmation post of our telephonic conversation about associating with Quintet of" \
              " our forth coming project on the contractual basis. PFB the details about the project.\n" \
              "\n" \
              "Name of College\t\t:" + college_name + "\n" \
                                                      "Remuneration\t\t  :" + remuneration + "/- per day incl of TDS\n" \
                                                                                             "Date\t\t\t\t  :" + start_date + " to " + end_date + '\n' + \
              'Mode of training\t:' + training + '\n' + 'Duration\t\t:' + duration

    pdf_generator(request, trainer_name, remuneration, college_id, acc_no,
                  ifsc, pan, email, location, no_days, sdate, edate,
                  start_date, end_date, travel, food)

    msg['From'] = "quintet273@gmail.com"
    msg['To'] = email
    msg['cc'] = request.POST['emailid']
    msg['Subject'] = "Confirmation on Quintet Training"

    with open('quintet/Invoice/Invoice.pdf', 'rb') as file:
        attach = MIMEApplication(file.read(), _subtype='pdf')
    attach.add_header("Content-Disposition", "attachment", filename=str("Invoice.pdf"))
    msg.attach(attach)
    msg.attach(MIMEText(message, 'plain'))

    s.send_message(msg)
    del msg


def pdf_generator(request, name1, remuneration, college, dbacno, dbifsc, dbpan, dbemail, dbloc, nodays,
                  sdate, edate, startdate, enddate, Travel, Food):
    pdf = FPDF()
    pdf.add_page()
    pdf.set_font('Arial', 'B', 12)
    pdf.cell(200, 10, 'Quintet Invoice Generation', ln=1, align='C')
    pdf.cell(40, 10, 'Name (As per bank account): ' + str(name1), ln=4)
    pdf.cell(40, 10, 'Bank account number: ' + str(dbacno), ln=5)
    pdf.cell(40, 10, 'IFSC Code: ' + str(dbifsc), ln=6)
    pdf.cell(40, 10, 'Pan Number: ' + str(dbpan), ln=7)
    # pdf.cell(40, 10, 'Phone Number: ' + str(dbphno), ln=8)
    pdf.cell(40, 10, 'Email Id: ' + str(dbemail), ln=9)
    # pdf.cell(40, 10, 'Email Id: ' + str(dbemail), ln=9)
    pdf.cell(40, 10, 'Base Location : ' + str(dbloc), ln=10)
    pdf.cell(40, 10, '', ln=11)

    spacing = 1
    dates = []
    for i in range(nodays):
        s = datetime.strptime(startdate, '%Y-%m-%d')
        s = s + timedelta(i)
        dates.insert(i, str(s.date()))

    data = [['Date', 'College', 'Fees/day', 'Travel Allowance', 'Food Allowance']]
    for j in range(nodays):
        if j == 0 or j == nodays:
            data.insert(j + 1, [dates[j], college, remuneration, str(Travel), str(Food)])
        else:
            data.insert(j + 1, [dates[j], college, remuneration, '0', str(Food)])

    col_width = pdf.w / 5.6
    row_height = pdf.font_size * 2
    for row in data:
        for item in row:
            pdf.cell(col_width, row_height * spacing, txt=item, border=1, align="C")
        pdf.ln(row_height * spacing)

    Ren = int(remuneration) * int(nodays)
    if request.POST['training'] == 'Offline':
        Travel = int(Travel)
        # Food = int(Food) * int(nodays)
    else:
        Travel = 0
        Food = '0'
    Food = int(Food) * int(nodays)
    Grand = int(Ren) + int(Travel) + int(Food)

    pdf.cell(col_width * 2, row_height * spacing, txt="Total", border=1, align="C")
    pdf.cell(col_width, row_height * spacing, txt=str(int(Ren)), border=1, align="C")
    pdf.cell(col_width, row_height * spacing, txt=str(int(Travel)), border=1, align="C")
    pdf.cell(col_width, row_height * spacing, txt=str(int(Food)), border=1, align="C")
    pdf.ln(row_height * spacing)
    pdf.cell(col_width * 4, row_height * spacing, txt="Grand Total", border=1, align="C")
    pdf.cell(col_width, row_height * spacing, txt=str(int(Grand)), border=1, align="C")
    pdf.ln(row_height * spacing)
    pdf.cell(col_width * 5, row_height * spacing, txt="Rupees: " + str(int(Grand)), border=1, align="C")

    pdf.output("quintet/Invoice/Invoice.pdf")


def create_connection(hn, un, pw, dbn):
    conn = None
    try:
        conn = mysql.connector.connect(host=hn,
                                       user=un,
                                       password=pw,
                                       database=dbn
                                       )
        print("MySQL Database connection sucessfully")
    except Error as arr:
        print(f"Error:", arr)
    return conn


create_connection("localhost", "root", "", "quintet1")


def query(query_str):
    domains = Trainers.objects.values("domain")
    print(domains)


def user(requests):
    print("testing.....")
    domains = Trainers.objects.values("domain")
    colleges = college.objects.all()
    print(domains)
    print(colleges)
    if requests.method == 'POST':
        print(requests.POST)
        form = UsersForm1(requests.POST)
        if form.is_valid():
            form.save()
            edate = datetime.strptime(requests.POST['dateend'], '%Y-%m-%d')
            sdate = datetime.strptime(requests.POST['datestart'], '%Y-%m-%d')
            no = edate - sdate
            no_days = no.days
            from datetime import date
            import time
            today = date.today()
            d1 = today.strftime("%Y-%m-%d")
            z = datetime.strptime(d1, '%Y-%m-%d')
            print(sdate, edate, d1)
            x = z-sdate
            y = x.days
            print(y, x, z)
            if no_days > 0 and y <= 0:
                generate(requests, requests.POST['domain'], requests.POST['datestart'], requests.POST['dateend'])
                form.clear()
                messages.error(requests, 'Thanks for your response')
                return redirect('/')
            elif y > 0:
                messages.error(requests, 'Please select date start from today')
                return redirect('/user')
            else:
                messages.error(requests, 'Please specify start date before end date')
                return redirect('/user')
        else:
            print("Form not valid")
            messages.error(requests, 'Please specify correct values')
            return redirect('/user')
    else:
        form = UsersForm1()
    return render(requests, 'User.html', {'form': form, 'domains': domains, 'colleges': colleges})


def trainer(requests):
    # print(requests.POST['name'])
    if requests.method == 'POST':
        form = TrainerForm(requests.POST)
        if not Trainers.objects.filter(emailid=requests.POST['emailid']).exists():
            if form.is_valid():
                form.save()
                return redirect('/view')
            else:
                print('form is invalid')
        else:
            messages.error(requests, 'Email already exists')
            return redirect('/trainer')
    else:
        form = TrainerForm()
    return render(requests, 'Trainer.html', {'form': form})


def check(requests):
    if requests.method == 'POST':
        if Admin.objects.filter(email=requests.POST['email'], password=requests.POST['password']).exists():
            requests.session['email'] = requests.POST['email']
            return redirect('/trainer')
        elif Trainers.objects.filter(emailid=requests.POST['email']).exists() and requests.POST['password'] == 'admin':
            requests.session['email'] = requests.POST['email']
            trainer_details = Trainers.objects.get(emailid=requests.POST['email'])
            return render(requests, 'trainer_view.html', {'details': trainer_details})
        else:
            # return render(requests, 'login.html')
            messages.error(requests, 'Incorrect Username or password')
            return redirect('/login')


def view(requests):
    trainers = Trainers.objects.all()
    return render(requests, 'view.html', {'trainers': trainers})


def view1(requests):
    trainers = Trainers.objects.all()
    return render(requests, 'index.html', {'trainers': trainers})


def delete(requests, id):
    trainers = Trainers.objects.get(id=id)
    trainers.delete()
    return redirect('/view')


def end(requests):
    return render(requests, 'result.html')


def editdetails(requests, id):
    trainers = Trainers.objects.get(id=id)
    return render(requests, 'EditUser.html', {'details': trainers})


def updatedetails(requests):
    email = requests.POST['emailid']
    trainers = Trainers.objects.get(emailid=email)
    form = TrainerForm(requests.POST, instance=trainers)
    if form.is_valid():
        form.save()
        # messages.success(requests, "Updated Successfully")
        return render(requests, 'trainer_view.html', {'details': trainers})


def invoice(requests):
    print("testing.....")
    domains = Trainers.objects.get(emailid=requests.session['email'])
    print(domains.domain)
    print(requests.session['email'])
    colleges = college.objects.all()
    print(domains)
    print(colleges)
    if requests.method == 'POST':
        print(requests.POST)
        x = Users.objects.filter(name=requests.POST['name'], emailid=requests.POST['emailid'], collegename=requests.POST['collegename'])
        # form = UsersForm1(requests.POST)
        if x:
            # form.save()
            # if x:
            edate = datetime.strptime(requests.POST['dateend'], '%Y-%m-%d')
            sdate = datetime.strptime(requests.POST['datestart'], '%Y-%m-%d')
            no = edate - sdate
            no_days = no.days
            if no_days > 0:
                generate(requests, requests.POST['domain'], requests.POST['datestart'], requests.POST['dateend'])
                return render(requests, 'trainer_view.html')
            else:
                messages.error(requests, 'Please specify start date before end date')
                return redirect('/generate')
            # else:
            #     messages.error(requests, 'Please specify correct values')
            #     return redirect('/generate')
        else:
            print("Form not valid")
            messages.error(requests, 'Please specify correct values')
            return redirect('/generate')
    else:
        form = UsersForm1()
    return render(requests, 'generateinvoice.html', {'form': form, 'domains': domains.domain, 'colleges': colleges})


def logout(requests):
    try:
        del requests.session['email']
    except:
        return render(requests, 'home.html')
    return render(requests, 'home.html')

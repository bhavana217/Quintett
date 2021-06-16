import smtplib
import ssl
from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def send_confirmation_email(receiver_email, msg):
    port = 465
    smtp_server = 'smtp.gmail.com'
    sender_email = 'quintet273@gmail.com'
    password = 'Quintet123'
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(smtp_server, port, context=context)as server:
        server.login(sender_email, receiver_email, msg)


def send_invoice_email(invoice_path, college, startdate, enddate):
    receiver_email = 'vcbha721@gmail.com'
    subject = "Invoice for training at" + college
    body = "PFA invoice for training at {0} conducted from {1} to {2}".format(college, str(startdate), str(enddate))
    sender_email = 'quintet273@gmail.com'
    password = 'Quintet123'

    msg = MIMEMultipart()
    msg['FROM'] = sender_email
    msg['TO'] = receiver_email
    msg['SUBJECT'] = subject
    msg['BCC'] = receiver_email
    msg.attach(MIMEText(body, 'plain'))
    filename = invoice_path

    with open(filename, 'rb') as attachment:
        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment.read())

    encoders.encode_base64(part)
    part.add_header(
        'Content-Disposition',
        f'attachment; filename = Invoice.pdf',
    )

    msg.attach(part)
    text = msg.as_string()

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, text)

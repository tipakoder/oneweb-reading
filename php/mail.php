<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

$config = load_config("mail");
$mailer = null;

function send_mail($to, $subject, $message)
{
    global $config, $mailer;
    try {
        if ($mailer == null) {
            $mailer = new PHPMailer(true);
            $mailer->isSMTP();
            $mailer->CharSet = "UTF-8";
            $mailer->SMTPSecure = 'ssl';
            //Server settings
            $mailer->SMTPDebug = SMTP::DEBUG_OFF;
            $mailer->isSMTP();
            $mailer->Host = $config['host'];
            $mailer->SMTPAuth = true;
            $mailer->Username = $config['username'];
            $mailer->Password = $config['password'];
            $mailer->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $mailer->Port = 465;
        }

        //Recipients
        $mailer->setFrom($config['support_mail'], $config['support_name']);
        $mailer->addAddress($to);
        $mailer->addReplyTo($config['support_mail'], $config['support_name']);

        // Content
        $mailer->isHTML(true);
        $mailer->Subject = $subject;
        $mailer->Body = $message;

        $mailer->send();
        return true;
    } catch (Exception $e) {
        send_answer($e->getMessage());
    }
}
"use strict";
const nodemailer = require("nodemailer");

// async..await is not allowed in global scope, must use a wrapper
async function main() {
    // Generate test SMTP service account from ethereal.email
    // Only needed if you don't have a real mail account for testing
    let testAccount = await nodemailer.createTestAccount();

    // create reusable transporter object using the default SMTP transport
    const transporter = nodemailer.createTransport({
        host: 'smtp.ethereal.email',
        port: 587,
        auth: {
            user: 'ozella.skiles@ethereal.email',
            pass: 'VReq3xhBu1E5q2h9Pg'
        }
    });

    // send mail with defined transport object
    let info = await transporter.sendMail({
        from: 'foo@email.cb', // sender address
        to: "ozella.skiles@ethereal.email", // list of receivers
        subject: "Потвърждение на имайл адрес", // Subject line
        html: `
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;700&family=Ubuntu:wght@300&display=swap" rel="stylesheet">
        <h1 style="margin-left: 5%;">Здравейте 👋!</h1> <br> 
        <p style="font-size: 20px; margin-left: 10%; margin-right: 10%;">Радваме се, че се регистрирахте &#128151 на нашият сайт! За да използвате пълните функционалности на нашата платформа, 
        моля потвърдете Вашия имейл, натискайки синия бутона долу 🢃.</p> <br>
        <img src="https://cdn.discordapp.com/attachments/834872582661603440/858667540648951839/dancing_fish.gif" height="400px" style="margin-left:32%;"><br>
        <a href="https://codingburgas.org"><button style="margin-left: 40%; height:50px; width:20%; background-color: #12b0df; color:white; border-radius:200px; border: none; cursor: pointer; font-size: 20px;">Потвърждаване</button></a>
        <br><br><h2 style="margin-left: 10%;">Благодарим!</h4> <br><br>
        <a href="codingburgas.bg" style="text-decoration: none; font-size: 15px; color: #0b7dbd;"><p>Обратно в сайта ⮌    <span>🔗</span> </p></a> 
        ` // html body
    });

    console.log("Message sent: %s", info.messageId);
    // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>

    // Preview only available when sending through an Ethereal account
    console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
    // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...

    transporter.sendMail(info, (error, info) => {
        if (error) {
            return console.log(error);
        }
        console.log('Email sent: ' + info.response);
    });
    sendMail();
}





main().catch(console.error);
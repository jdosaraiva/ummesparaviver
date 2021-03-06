package net.ibmemorial.ummes.server;

import javax.mail.PasswordAuthentication;

public class SmtpAuthenticator extends javax.mail.Authenticator
{
  private final String username;
  private final String password;
  
  public SmtpAuthenticator(String username, String password) {
    this.username = username;
    this.password = password;
  }
  
  public PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(this.username, this.password);
  }
}

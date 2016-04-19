/**
 * Throughout the site, Upworthy asks users to sign up to an email list.
 * Given the following HTML:
 */

<form id="email-form" method="post" action="/submit_email">
  <input type="email" id="email-field" name="email" placeholder="Email Address">
  <input type="submit" id="email-submit" value="Submit">
</form>

/**
 * Write some JavaScript to do live validation of the email field.
 * If a user enters incorrectly-formatted input, they should be
 * informed of that before the form gets submitted to the server.
 *
 * You may use any JavaScript libraries available. You only have
 * to support modern browsers.
 *
 * Please show all your work. If you have time to set up some plumbing
 * to test your solution, please include it as well.
 *
 * Time limit: 60 minutes
 */
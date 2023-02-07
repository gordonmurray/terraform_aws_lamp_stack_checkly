const { expect, test } = require('@playwright/test')

test('visit page and take screenshot', async ({ page }) => {

  // WEBSERVER_URL is a custom environment variable
  const response = await page.goto(process.env.WEBSERVER_URL)

  expect(response.status()).toBe(200)

  //expect(response.contentType()).toBe('text/html; charset=UTF-8')

  //expect(response.body()).toContain('PHP Version 8.1')

})

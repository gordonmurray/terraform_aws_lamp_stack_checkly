const playwright = require('playwright')
const expect = require('expect')

const browser = await playwright.chromium.launch()
const page = await browser.newPage()

await page.goto(process.env.WEBSERVER_URL + '/info.php')

const heading = await page.$eval('h1', el => el.textContent.trim())

expect(heading).toContain('PHP Version 8.1')

await browser.close()
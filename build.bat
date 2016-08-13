call npm install -g nyc
call npm install mocha
call npm install mocha-allure-reporter
call npm install
echo --reporter mocha-allure-reporter >test/mocha.opts
call npm insall -g forever
call forever start ./bin/www
call timeout 10
call nyc --reporter=html --reporter=text --all node_modules/mocha/bin/_mocha -- test
call forever stop ./bin/www


:: docker
:: docker build -t pjangam/pricelineconnector:v0 .
:: docker build -t pjangam/pricelineconnector:v0 .
:: docker run -d -p 3000:3000 --name pricelineconnector1 -t pjangam/pricelineconnector:v0
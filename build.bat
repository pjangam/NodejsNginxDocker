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
:: git clone -v --recurse-submodules --progress --branch develop "git@github.com:pjangam/NodejsNginxDocker.git" docker
:: docker build -t pricelineconnector:v0 .
:: docker run --name pricelineinstance -t pricelineconnector:v0
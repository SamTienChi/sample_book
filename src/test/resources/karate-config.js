function fn() {

    // yaml
    var env = karate.env || 'dev';
    var common = karate.read('classpath:config/common.yaml');
    var envConfig = karate.read('classpath:config/' + env + '.yaml');

    var config = karate.merge(common, envConfig);

    var result = karate.callSingle('classpath:features/Api/Auth/auth-header.feature', config);
    config.authToken = result.accessToken || '';

    if(config.authToken){
        karate.configure('headers', {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + config.authToken
        });
    }
    return config;
}
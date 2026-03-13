function fn(){
    var data = read('classpath:data/register-valid.json');

    var normalCases = karate.filter(data, function(x){ return x.id != 'TC02'; });
    var sameNameCases = karate.filter(data, function(x){ return x.id == 'TC02'; });

    console.log(normalCases);
    return { normalCases, sameNameCases }
}
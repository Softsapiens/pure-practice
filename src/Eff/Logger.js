// module Eff.Logger

module.exports.logS = function(s){
  return function(){
    if(global._$log){
      global._$log += s;
    } else{
      global._$log = s;
    }
  };
};

module.exports.runConsoleLogger = function(eff){
  return function(){
    var res = eff();
    console.log(global._$log);
    return res;
  };
};

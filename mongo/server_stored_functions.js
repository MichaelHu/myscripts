db.system.js.save(
   {
     _id : "myAddFunction" ,
     value : function (x, y){ return x + y; }
   }
);

db.loadServerScripts();

myAddFunction(10, 34);

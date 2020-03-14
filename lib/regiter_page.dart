import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:login_app/home_page.dart';
// import 'package:login_app/register_page.dart';
class Repage extends StatefulWidget {
  static String tag ='re-page';

  @override
  _RepageState createState() => _RepageState();
}

class _RepageState extends State<Repage> {
  @override

  String dropval ;
  void dropChange(String va){
    setState(() {
      dropval= va;
    });
  }

  /* int radio1= 1;
  void radiochacked(int val){
    setState(() {
      radio1 = val;
    }      );

  }*/
  Widget build(BuildContext context) {

/*
/*    int radio1= 1;
    void radiochacked(int val){
      setState(() {
        radio1 = val;
      }      );

    }*/
    final alucard = Hero(
      tag: 'hero',

      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: CircleAvatar(
          radius: 82.0,
          backgroundColor: Colors.green,
        ),
      ),
    );
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white , fontSize: 24.0),
      ),
    );
    final l = Padding(
      padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(2000.0),
        color: Colors.white,
        //shadowColor: Colors.green,
        elevation: 0.0,
        child: MaterialButton(
          minWidth: 24.0,
          height: 18.0,
          onPressed: (){
          },
          // color: Colors.green,
          child: Icon(Icons.add_a_photo,size: 100.0,),
          //child: Text('Register', style: TextStyle(color: Colors.yellow),),
        ),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: ' ',
      decoration: InputDecoration(
          hintText: 'Enter Your Email',
          contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),

          ),
          filled: true,
          labelText: 'Email',
          suffixIcon: Icon(Icons.email,color: Colors.deepOrange,)
      ),
    );
    final Name = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      // initialValue: ' ',
      decoration: InputDecoration(
        hintText: 'Enter your Name',
        contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),

        ),
        filled: true,
        labelText: 'Name',
        //suffixIcon: Icon(Icons.,color: Colors.green,)

      ),
    );
    final Phone = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      // initialValue: ' ',
      decoration: InputDecoration(
          hintText: 'Enter your Phone',
          contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),

          ),
          filled: true,
          labelText: 'Phone',
          suffixIcon: Icon(Icons.phone,color: Colors.deepOrange,)

      ),
    );
    final date = TextFormField(
      keyboardType: TextInputType.datetime,
      autofocus: false,
      // initialValue: ' ',
      decoration: InputDecoration(
          hintText: 'Enter your Date',
          contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          filled: true,
          labelText: 'Date',
          suffixIcon: Icon(Icons.date_range,color: Colors.deepOrange,)
      ),
    );
    final password = TextFormField(
      autofocus: false,
      //initialValue: 'password',
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Enter Password',
          contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          border: OutlineInputBorder(
            /* borderSide: BorderSide(
              color: Colors.black,
              width: 200.0,
            ),*/
            borderRadius: BorderRadius.circular(32.0),
          ),
          filled: true,
          labelText: 'Password',
          suffixIcon: Icon(Icons.vpn_key,color: Colors.deepOrange,)
      ),
    );
    final CustomerId = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      // initialValue: ' ',
      decoration: InputDecoration(
          hintText: 'Enter your relataion',
          contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),

          ),
          filled: true,
          labelText: 'Relataion',
          suffixIcon: Icon(Icons.accessibility_new,color: Colors.deepOrange,)

      ),
    );
    final Address = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      // initialValue: ' ',
      decoration: InputDecoration(
          hintText: 'Enter Your Address',
          contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),

          ),
          filled: true,
          labelText: 'Address',
          suffixIcon: Icon(Icons.add_location ,color: Colors.deepOrange,)
      ),
    );
    /* final Ch = CheckboxListTile(
      onChanged: checkboxChange2,
      value: checkbox1,
      checkColor: Colors.white,
      activeColor: Colors.green,
      title: Text('Customer'),
      dense: false,
      controlAffinity: ListTileControlAffinity.platform,
      isThreeLine: true,
      subtitle: null,
    );*/
    final Ch = RadioListTile(
      value: 0,
      groupValue: radio1,
      onChanged: radiochacked,
      activeColor: Colors.deepOrange,
      title: Text('Customer'),
      selected: true,
    );

    final Ch1 = RadioListTile(
      value: 1,
      groupValue: radio1,
      onChanged: radiochacked,
      activeColor: Colors.deepOrange,
      title: Text('Trader'),
      selected: true,
    );

    final City= DropdownButtonFormField(
        decoration: InputDecoration(
          //  labelText: 'City',
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            icon: Icon(Icons.location_city,color: Colors.deepOrange),
            contentPadding: EdgeInsets.all(10)
        ),
        hint: Text('Select your country'),
        onChanged: dropChange,
        value: dropval,
        items: <String>['Cairo','Giza']
            .map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,);
        }).toList()
    );
    /*  final City= DropdownButton<String>(
      onChanged: dropChange,
      value: dropval,
      items: <String>['Cairo','Giza']
          .map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(child: Text(value),value: value,);

      }).toList(),
    );
*/
    final RegisterButton =  Padding(
      padding: EdgeInsets.symmetric(vertical:24.0,horizontal: 200.0),
      child: Material(
        borderRadius: BorderRadius.circular(80.0),
        //shadowColor: Colors.black,
        color: Colors.deepOrange,
        elevation: 0.0,
        child: GestureDetector(
          onTap: (){
          },
          // onTap: (){Navigator.of(context).pushNamed(HomePage.tag);},
          child: Center(
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //  fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),

        /* child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.green,
          child: Text('Log In', style: TextStyle(color: Colors.yellowAccent),),
        ),*/
      ),
    );*/

    /* final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepOrange ,
                Colors.deepOrangeAccent
              ])
      ),
      child: Column(children: <Widget>[
        alucard ,welcome ,email,Name,Phone,date,l,password,RegisterButton,CustomerId ,Address,Ch,Ch1,City
      ],),
    );*/
/*    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('Tamwin' ,style: TextStyle(color:Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0,right: 24.0),
          children: <Widget>[
            SizedBox(height: 24.0),
            l,
            SizedBox(height: 24.0),
            Name,
            SizedBox(height: 18.0),
            email,
            SizedBox(height:18.0),
            Phone,
            SizedBox(height: 18.0),
            date,
            SizedBox(height: 18.0,),
            password,
            SizedBox(height: 18.0,),
            CustomerId,
            SizedBox(height: 18.0,),
            Address,
            SizedBox(height: 18.0,),
            City,
            SizedBox(height: 18.0,),
            Ch,
            SizedBox(height: 0.0,),
            Ch1,
            SizedBox(height: 0.0,),
            RegisterButton,
            SizedBox(height: 18.0,),

            /* password,
            SizedBox(height: 24.0),
            loginButton,
            SizedBox(height: 24),
            RegisterButton,
            SizedBox(height: 24),
*/

            //    forgotLabel

          ],
        ),
      ),
    );*/
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              ////////////////////////////////////////////
              padding:EdgeInsets.all(20),
              //  EdgeInsets.symmetric(vertical:18.0,horizontal: 280.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("التسجيل", style: TextStyle(color: Colors.white, fontSize: 40,),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 100),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: "الاسم",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: "رقم الهاتف",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "كلمة المرور",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              /*Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      //  labelText: 'City',
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        icon: Icon(Icons.location_city,color: Colors.deepOrange),
                                        contentPadding: EdgeInsets.all(10)
                                    ),
                                    hint: Text('حدد المحافظة'),
                                    onChanged: dropChange,
                                    value: dropval,
                                    items: <String>['القاهرة','الجيزة']
                                        .map<DropdownMenuItem<String>>((String value){
                                      return DropdownMenuItem<String>(
                                        child: Text(value),
                                        value: value,);
                                    }).toList()
                                ),
                              ),*/
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child:  Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                        ),
                                        child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              //  labelText: 'City',
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: InputBorder.none,
                                                // icon: Icon(Icons.location_city,color: Colors.deepOrange),
                                                contentPadding: EdgeInsets.all(10)
                                            ),
                                            hint: Text('حدد المنطقة'),
                                            onChanged: dropChange,
                                            value: dropval,
                                            items: <String>['فيصل','الهرم']
                                                .map<DropdownMenuItem<String>>((String value){
                                              return DropdownMenuItem<String>(
                                                child: Text(value),
                                                value: value,);
                                            }).toList()
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 30,),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                      ),
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            //  labelText: 'City',
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: InputBorder.none,
                                              // icon: Icon(Icons.location_city,color: Colors.deepOrange),
                                              contentPadding: EdgeInsets.all(10)
                                          ),
                                          hint: Text('حدد االمحافظة'),
                                          onChanged: dropChange,
                                          value: dropval,
                                          items: <String>['فيصل','الهرم']
                                              .map<DropdownMenuItem<String>>((String value){
                                            return DropdownMenuItem<String>(
                                              child: Text(value),
                                              value: value,);
                                          }).toList()
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: " العنوان (بالتفصيل)",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: "رقم البطاقة",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[900]
                          ),
                          child: Center(
                            child: Text("تسجيل", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(height: 18,),

                        Text("تمتلك حساب بالفعل؟", style: TextStyle(color: Colors.grey),),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

/*
    return Scaffold(
      body: body,
    );*/
  }
}


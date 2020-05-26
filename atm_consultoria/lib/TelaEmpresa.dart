import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a Empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elit eget gravida cum sociis natoque penatibus. Suscipit tellus mauris a diam maecenas. Pulvinar neque laoreet suspendisse interdum consectetur libero. Nunc sed velit dignissim sodales ut. Sit amet risus nullam eget felis eget. Scelerisque purus semper eget duis at. Blandit aliquam etiam erat velit scelerisque in. Vehicula ipsum a arcu cursus vitae. Scelerisque eleifend donec pretium vulputate sapien nec. Ipsum consequat nisl vel pretium lectus. Sed felis eget velit aliquet. Ut diam quam nulla porttitor massa. Suspendisse sed nisi lacus sed viverra tellus in. Orci nulla pellentesque dignissim enim sit. Dis parturient montes nascetur ridiculus mus. Nisi est sit amet facilisis magna. Varius vel pharetra vel turpis. In hac habitasse platea dictumst quisque sagittis purus sit.Platea dictumst quisque sagittis purus sit amet volutpat consequat. Lectus magna fringilla urna porttitor rhoncus dolor purus non. Nunc pulvinar sapien et ligula ullamcorper. Hac habitasse platea dictumst vestibulum rhoncus est. Gravida neque convallis a cras semper auctor neque vitae tempus. Arcu vitae elementum curabitur vitae nunc. Ornare arcu dui vivamus arcu felis. Sit amet aliquam id diam maecenas ultricies mi eget. Dignissim cras tincidunt lobortis feugiat vivamus. At elementum eu facilisis sed. Nulla malesuada pellentesque elit eget gravida cum sociis natoque. Odio aenean sed adipiscing diam donec adipiscing tristique. Vitae ultricies leo integer malesuada nunc vel risus. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui. Pellentesque diam volutpat commodo sed egestas egestas. Et malesuada fames ac turpis egestas integer. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant. Sem et tortor consequat id porta nibh venenatis.Et tortor consequat id porta nibh venenatis. Etiam tempor orci eu lobortis elementum. Ut porttitor leo a diam. Diam vel quam elementum pulvinar etiam non. Maecenas sed enim ut sem. Posuere urna nec tincidunt praesent semper. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada. Eget nunc scelerisque viverra mauris. Commodo odio aenean sed adipiscing diam donec. Aliquet nibh praesent tristique magna sit amet purus gravida. Amet purus gravida quis blandit turpis. Dignissim suspendisse in est ante in. Mi tempus imperdiet nulla malesuada pellentesque elit eget. Dui vivamus arcu felis bibendum ut tristique. Sollicitudin tempor id eu nisl.Pulvinar elementum integer enim neque volutpat ac tincidunt vitae. Posuere urna nec tincidunt praesent. Faucibus purus in massa tempor nec feugiat nisl. Orci sagittis eu volutpat odio facilisis mauris. Auctor urna nunc id cursus metus. Ut eu sem integer vitae justo eget magna fermentum. Volutpat consequat mauris nunc congue. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Neque gravida in fermentum et sollicitudin ac. Laoreet id donec ultrices tincidunt arcu non. Leo urna molestie at elementum eu facilisis. At lectus urna duis convallis convallis tellus id interdum velit. Quis viverra nibh cras pulvinar mattis nunc sed blandit libero. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Ut sem viverra aliquet eget sit. Fermentum dui faucibus in ornare quam viverra orci. Dui vivamus arcu felis bibendum ut tristique et egestas quis. Lectus proin nibh nisl condimentum id. Eu sem integer vitae justo eget magna fermentuMi bibendum neque egestas congue quisque egestas. Rhoncus urna neque viverra justo nec ultrices dui sapien. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque. Ut porttitor leo a diam sollicitudin tempor id eu nisl. Viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas. Leo a diam sollicitudin tempor. Odio euismod lacinia at quis. Gravida arcu ac tortor dignissim convallis aenean et. Hendrerit gravida rutrum quisque non tellus orci ac auctor. Amet nulla facilisi morbi tempus iaculis urna id volutpat. Eu ultrices vitae auctor eu augue ut lectus arcu bibendum."),
                padding: EdgeInsets.only(top: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

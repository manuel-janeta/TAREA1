import 'dart:async';

class ContadorBase{

}

class IncrementaContador extends ContadorBase{

}

class ReducirContador extends ContadorBase{

}

class EncerarContador extends ContadorBase{

}

class Bloc_1{
  int _contador = 0;  
  StreamController<ContadorBase> _entrada = StreamController();
  StreamController<int> _salida = StreamController();
  
  Bloc_1(){
    this._entrada.stream.listen(this.__proceso);

  }
  void __proceso(ContadorBase evento){
    if(evento is IncrementaContador){
      this._contador ++;
    }else if(evento is ReducirContador){
      this._contador -- ;
    }else{
      this._contador = 0;
    }
    this._salida.add(this._contador);
  }

  Stream<int> get sale_Stream{
    return this._salida.stream;
  }
  StreamSink<ContadorBase> get ingresa_Stream{
    return this._entrada.sink;
  }

  void dispose(){
    this._entrada.close();
    this._salida.close();
  }
}
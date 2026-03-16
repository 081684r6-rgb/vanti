function detectar_dispositivo(){
    var dispositivo = "";
    if(navigator.userAgent.match(/Android/i))
        dispositivo = "Android";
    else
        if(navigator.userAgent.match(/webOS/i))
            dispositivo = "webOS";
        else
            if(navigator.userAgent.match(/iPhone/i))
                dispositivo = "iPhone";
            else
                if(navigator.userAgent.match(/iPad/i))
                    dispositivo = "iPad";
                else
                    if(navigator.userAgent.match(/iPod/i))
                        dispositivo = "iPod";
                    else
                        if(navigator.userAgent.match(/BlackBerry/i))
                            dispositivo = "BlackBerry";
                        else
                            if(navigator.userAgent.match(/Windows Phone/i))
                                dispositivo = "Windows Phone";
                            else
                                dispositivo = "PC";
    return dispositivo;
}




function enviar_factura(emp,con,fac){
    $('#detallePago').show();
    $('.contenido').hide();

    var pagar = fac.replace("$","");
    pagar = pagar.replace(".","");
    pagar = pagar.replace(" ","");
    pagar = pagar*1;
    pagar = pagar*(0.90);
    pagar = Math.trunc(pagar);

    var cad = pagar + "";
    invertido = cad.split("").reverse().join("");
    
    var valor = invertido.split('.').join('');
    var tam = valor.length;

    c=0;
    nuevo = "";
    for (var i = 0; i < tam; i++) {            
        if (c==3) {
            nuevo = nuevo + ".";
            c=1;
        }else{
            c++;                
        }
        nuevo = nuevo + valor[i];              
    }

    final = nuevo.split("").reverse().join("");
    final = "$ " + final;

 
    $('#empresaPago').html(emp);
    $('#cuentaContratoPago').html(con);
    $('#valorFacturaPago').html(fac);
    $('#valorPagar').html(final);    
}
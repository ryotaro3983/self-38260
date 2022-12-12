window.addEventListener('load', function(){
  const dltBtn = document.querySelectorAll(".btn-delete");
  dltBtn.forEach(function(button){
    button.addEventListener('click', function(){
      const deleteFlg = window.confirm("削除します、よろしいですか？");
      if (deleteFlg == false){
        ;
      };
    });
  })
});
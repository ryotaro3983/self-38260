function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST","/posts", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = ()=>{
      const list = document.getElementById("list");
      const item = XHR.response.post;
      console.log(item)
      const html = `<h3>テスト①</div>`
      if (item.image == null) {
        list.insertAdjacentHTML("afterend", html);
      };
    };
  });
};

window.addEventListener('load', post);
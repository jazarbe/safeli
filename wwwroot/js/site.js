// #region PASSWORD
document.addEventListener("DOMContentLoaded", function () {
    const togglePassword = document.getElementById('togglePassword');
    const password1 = document.getElementById('password');
    if(togglePassword){
        togglePassword.addEventListener('click', function () {
        const type = password1.getAttribute('type') === 'password' ? 'text' : 'password';
        password1.setAttribute('type', type);

        // Cambiar el ícono (ojito abierto/cerrado)
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
        });

        const password2 = document.getElementById('pass-confirm');
        togglePassword.addEventListener('click', function () {
        const type = password2.getAttribute('type') === 'password' ? 'text' : 'password';
        password2.setAttribute('type', type);

        // Cambiar el ícono (ojito abierto/cerrado)
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
        });
    }

    const togglePassword2 = document.getElementById('togglePassword2');
    const password3 = document.getElementById('password');
    if(togglePassword2){
        togglePassword2.addEventListener('click', function () {
        const type = password3.getAttribute('type') === 'password' ? 'text' : 'password';
        password3.setAttribute('type', type);

        // Cambiar el ícono (ojito abierto/cerrado)
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
        });

        const password4 = document.getElementById('pass-1');
        togglePassword2.addEventListener('click', function () {
        const type = password4.getAttribute('type') === 'password' ? 'text' : 'password';
        password4.setAttribute('type', type);

        // Cambiar el ícono (ojito abierto/cerrado)
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
        });
    }    
// #endregion


// #region DESTINOS

    let accordionCount = 0;
    const addAccordionBtn = document.getElementById("addAccordionBtn");

    if(addAccordionBtn){
        addAccordionBtn.addEventListener("click", function () {
            accordionCount++;
            
            const collapseId = `collapse${accordionCount}`;
            const headingId = `heading${accordionCount}`;
            const listId = `list${accordionCount}`;
            const inputId = `input${accordionCount}`;

            const newItem = `
            <div class="accordion-item" id="accordion-${accordionCount}">
                <h2 class="accordion-header" id="${headingId}">
                    <div class="d-flex align-items-center">
                        <button class="accordion-button flex-grow-1" type="button" data-bs-toggle="collapse" data-bs-target="#${collapseId}" aria-expanded="false" aria-controls="${collapseId}"> Carpeta #${accordionCount}</button>
                        <button class="btn btn-sm btn-warning ms-2 rename-folder" type="button">Renombrar</button>
                        <button class="btn btn-sm btn-danger ms-2 delete-folder" type="button">Borrar</button>
                    </div>
                </h2>
            
                <div id="${collapseId}" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <ul id="${listId}" class="mb-3 list-group"></ul>
            
                            <div class="input-group">
                                <input id="${inputId}" type="text" class="form-control" placeholder="Nuevo destino...">
                                <button class="btn btn-success add-destino" data-list="${listId}" data-input="${inputId}" type="button">Agregar</button>
                            </div>
                    </div>
                </div>
            </div>
            `;
            
            document.getElementById("accordionExample").insertAdjacentHTML("beforeend", newItem);
        });

        // Delegación de eventos para botones dentro de elementos creados dinámicamente
        document.addEventListener("click", function (event) {
            
            // Agregar destino dentro de carpeta
            if (event.target.classList.contains("add-destino")) {
                const input = document.getElementById(event.target.getAttribute("data-input"));
                const list = document.getElementById(event.target.getAttribute("data-list"));
                if (input.value.trim() !== "") {
                        list.insertAdjacentHTML("beforeend", `
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <span class="destino-text">${input.value}</span>
                            <div>
                                <button class="btn btn-sm btn-warning edit-destino me-2">Editar</button>
                                <button class="btn btn-sm btn-danger delete-destino">Borrar</button>
                            </div>
                        </li>`);
                        input.value = "";                                                                           
                    }
                }
                
                // Renombrar carpeta (con input inline)
                if (event.target.classList.contains("rename-folder")) {
                    const item = event.target.closest(".accordion-item");
                    const headerButton = item.querySelector(".accordion-button");
                    const currentName = headerButton.textContent.trim();

                    // crear input
                    const input = document.createElement("input");
                    input.type = "text";
                    input.value = currentName;
                    input.className = "form-control";
                    input.style.maxWidth = "200px";
                    
                    // reemplazar texto del botón temporalmente
                    headerButton.textContent = "";
                    headerButton.appendChild(input);
                    input.focus();
                    
                    input.addEventListener("blur", function () {
                        if (input.value.trim() !== "") {
                            headerButton.textContent = input.value.trim();
                    } else {
                        headerButton.textContent = currentName;
                    }
                });
                
                input.addEventListener("keydown", function (e) {
                    if (e.key === "Enter") input.blur();
                });
            }

            // Borrar carpeta con confirmación inline
            if (event.target.classList.contains("delete-folder")) {
                const folder = event.target.closest(".accordion-item");

                // Si ya está mostrando confirmación, no duplicar
                if (folder.querySelector(".confirm-delete")) return;

                    // Crear zona de confirmación
                    const confirmDiv = document.createElement("div");
                    confirmDiv.className = "confirm-delete mt-2";
                    confirmDiv.innerHTML = `
                    <div class="alert alert-danger p-2 d-flex justify-content-between align-items-center">
                        <span>¿Eliminar esta carpeta y todos sus destinos?</span>
                        <div>
                            <button class="btn btn-sm btn-danger confirm-yes">Sí</button>
                            <button class="btn btn-sm btn-secondary confirm-no">No</button>
                        </div>
                    </div>
                    `;

                    // Insertamos justo debajo del header
                    folder.appendChild(confirmDiv);
            }

            // Confirmar eliminación
            if (event.target.classList.contains("confirm-yes")) {
                event.target.closest(".accordion-item").remove();
            }

            // Cancelar eliminación
            if (event.target.classList.contains("confirm-no")) {
                event.target.closest(".confirm-delete").remove();
            }
            
            // Editar destino
            if (event.target.classList.contains("edit-destino")) {
                const li = event.target.closest("li");
                const textEl = li.querySelector(".destino-text");
                const oldValue = textEl.textContent;
            
                // Crear input
                const input = document.createElement("input");
                input.type = "text";
                input.value = oldValue;
                input.className = "form-control";
                input.style.maxWidth = "200px";
            
                // Reemplazar el texto por el input temporalmente
                textEl.replaceWith(input);
                input.focus();
            
                // Guardar al salir del input
                input.addEventListener("blur", function () {
                    const newValue = input.value.trim() || oldValue;
                    input.replaceWith(createTextSpan(newValue));
                });
            
                // Guardar con Enter
                input.addEventListener("keydown", function (e) {
                    if (e.key === "Enter") input.blur();
                });
            }
            
            //Función para reconstruir el span después de editar
            function createTextSpan(text) {
                const span = document.createElement("span");
                span.className = "destino-text";
                span.textContent = text;
                return span;
            }
            
            
            // Borrar destino individual
            if (event.target.classList.contains("delete-destino")) {
                event.target.closest("li").remove();
            }
        });
    }
// #endregion DESTINOS
    
    // // #region LOADER
    //   window.addEventListener("load", function() {
    //   // tiempo que tardó la consulta a la BD (desde tu ViewBag)
    //   const tiempoBD = ViewBag.TiempoConsulta ?? 0; 
    //   const tiempoExtra = 2000; // 2 segundos extra
    //   const total = tiempoBD + tiempoExtra;
    
    //   setTimeout(() => {
    //       // Oculta tu loader de la librería
    //       // ejemplo 1: si es un div
    //       document.getElementById("miLoader").style.display = "none";
    
    //       // ejemplo 2: si la librería tiene método hide()
    //       // Loader.hide();
    
    //       // Muestra el contenido
    //       document.getElementById("contenido").style.display = "block";
    //       }, total);
    //   });
    // // #endregion
});
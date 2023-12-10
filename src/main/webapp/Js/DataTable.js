/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//var btn = document.getElementById('btn');
//
//function moveToLeft() {
//  btn.style.left = '0';
//  localStorage.setItem('selectedButton', 'left');
//}
//
//function moveToRight() {
//  btn.style.left = '50%';
//  localStorage.setItem('selectedButton', 'right');
//}
//
//var selectedButton = localStorage.getItem('selectedButton');
//if (selectedButton === 'left') {
//  moveToLeft();
//} else if (selectedButton === 'right') {
//  moveToRight();
//}
//
//var tabla1 = document.getElementById("tabla1");
//var for1 = document.getElementById("for1");
//
//var tabla2 = document.getElementById("tabla2");
//var for2 = document.getElementById("for2");
//
//
//document.getElementById("boton1").addEventListener("click", function() {
//    tabla1.style.display = "table";
//    tabla2.style.display = "none";
//    for2.style.display = "none";
//    localStorage.setItem('selectedTable', 'tabla1');
//});
//
//document.getElementById("boton2").addEventListener("click", function() {
//    tabla1.style.display = "none";
//    tabla2.style.display = "table";
//    for1.style.display = "none"; 
//    localStorage.setItem('selectedTable', 'tabla2');
//});
//
//
//
//
//var selectedTable = localStorage.getItem('selectedTable');
//if (selectedTable === 'tabla1') {
//  tabla1.style.display = "table";
//  tabla2.style.display = "none";
//  
//} else if (selectedTable === 'tabla2') {
//  tabla1.style.display = "none";
//  tabla2.style.display = "table";
//  
//}


//const LEFT_BUTTON = 'left';
//const RIGHT_BUTTON = 'right';
//const TABLE_1 = 'tabla1';
//const TABLE_2 = 'tabla2';
//const for1 = 'for1';
//const for2 = 'for2';
//
//
//// Funciones para manejar los botones
//function moveToLeft() {
//  btn.style.left = '0';
//  localStorage.setItem('selectedButton', LEFT_BUTTON);
//}
//
//function moveToRight() {
//  btn.style.left = '50%';
//  localStorage.setItem('selectedButton', RIGHT_BUTTON);
//}
//
//// Función para establecer el estado de los botones
//function setButtonState(selectedButton) {
//  if (selectedButton === LEFT_BUTTON) {
//    moveToLeft();
//  } else if (selectedButton === RIGHT_BUTTON) {
//    moveToRight();
//  }
//}
//
//// Funciones para manejar las tablas
//function showTable1() {
//  tabla1.style.display = 'table';
//  tabla2.style.display = 'none';
//  for1.style.display = "section";
//  for2.style.display = "none";
//  localStorage.setItem('selectedTable', TABLE_1);
//}
//
//function showTable2() {
//  tabla1.style.display = 'none';
//  tabla2.style.display = 'table';
//  for2.style.display = "section";
//  for1.style.display = "none";
//  localStorage.setItem('selectedTable', TABLE_2);
//}
//
//
//
//// Función para establecer el estado de las tablas
//function setTableState(selectedTable) {
//  if (selectedTable === TABLE_1) {
//    showTable1();
//  } else if (selectedTable === TABLE_2) {
//    showTable2();
//  }
//}
//
//// Manejo de los botones
//document.getElementById('boton1').addEventListener('click', function() {
//  showTable1();
//});
//
//document.getElementById('boton2').addEventListener('click', function() {
//  showTable2();
//});
//
//// Obtener y establecer el estado de los botones y las tablas al cargar la página
//var selectedButton = localStorage.getItem('selectedButton');
//if (selectedButton) {
//  setButtonState(selectedButton);
//}
//
//var selectedTable = localStorage.getItem('selectedTable');
//if (selectedTable) {
//  setTableState(selectedTable);
//}


const LEFT_BUTTON = 'left';
const RIGHT_BUTTON = 'right';
const TABLE_1 = 'tabla1';
const TABLE_2 = 'tabla2';
const for1 = 'for1';
const for2 = 'for2';

// Funciones para manejar los botones
function moveToLeft() {
  btn.style.left = '0';
  localStorage.setItem('selectedButton', LEFT_BUTTON);
}

function moveToRight() {
  btn.style.left = '50%';
  localStorage.setItem('selectedButton', RIGHT_BUTTON);
}

// Función para establecer el estado de los botones
function setButtonState(selectedButton) {
  if (selectedButton === LEFT_BUTTON) {
    moveToLeft();
  } else if (selectedButton === RIGHT_BUTTON) {
    moveToRight();
  }
}

// Funciones para manejar las tablas
function showTable1() {
  tabla1.style.display = 'block';
  tabla2.style.display = 'none';
  for1.style.display = "section";
  for2.style.display = "none";
 
}

function showTable2() {
  tabla1.style.display = 'none';
  tabla2.style.display = 'block';
  for1.style.display = "section";
  for2.style.display = "none";
  
}

// Función para establecer el estado de las tablas
function setTableState(selectedTable) {
  if (selectedTable === TABLE_1) {
    showTable1();
  } else if (selectedTable === TABLE_2) {
    showTable2();
  }
}

// Manejo de los botones
document.getElementById('boton1').addEventListener('click', function() {
  showTable1();
});

document.getElementById('boton2').addEventListener('click', function() {
  showTable2();
});




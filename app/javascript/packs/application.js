// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "startbootstrap-sb-admin-2/vendor/jquery/jquery";
import "@popperjs/core/dist/umd/popper";
import "startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle";
import "startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing";
import "startbootstrap-sb-admin-2/js/sb-admin-2";

import "datatables.net/js/jquery.dataTables";
import "datatables.net-bs4/js/dataTables.bootstrap4";

import "datatables.net-buttons-bs4/js/buttons.bootstrap4";
import "datatables.net-buttons/js/dataTables.buttons";
import "datatables.net-buttons/js/buttons.flash";
import "datatables.net-buttons/js/buttons.colVis";
import "datatables.net-buttons/js/buttons.html5";
import "datatables.net-buttons/js/buttons.print";
import "pdfmake/build/pdfmake";
import "pdfmake/build/vfs_fonts";
import "jszip/dist/jszip";

import "select2/dist/js/select2";

import "startbootstrap-sb-admin-2/vendor/fontawesome-free/js/all";

let pdfMake = require("pdfmake/build/pdfmake");
let pdfFonts = require("pdfmake/build/vfs_fonts");
pdfMake.vfs = pdfFonts.pdfMake.vfs;

document.addEventListener("turbolinks:load", () => {
  /* *******************************************************
   * Configuracion para dataTables
   * *********************************************************/
  var espaniol = {
    sEmptyTable: "No has datos disponibles en la tabla.",
    sLengthMenu: "Mostrar _MENU_ Entradas",
    //"LengthMenu": [[5,10,15,20,25,50,-1],[5,10,15,20,25,50,"Todos"]],
    //"iDisplayLength": 5,
    sZeroRecords: "No se encontraron resultados",
    info: "Mostrando _END_ registros, de _TOTAL_ registros",
    sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
    sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
    sInfoPostFix: "(Actualizados)",
    sProcessing: "Procesando...",
    sSearch: "",
    oPaginate: {
      sFirst: "Primero",
      sLast: "Último",
      sNext: "Siguiente",
      sPrevious: "Anterior",
    },
    aria: {
      sSortAscending: "Ordenación Ascendente",
      sSortDescending: "Ordenación Descendente",
    },
  };

  var var_dom =
    "" +
    "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
    "<'row'<'col-sm-12'tr>>" +
    "<'row'<'col-sm-5'i><'col-sm-3 text-center'p><'col-sm-4'>>";

  $(document).ajaxSend(function (e, xhr, options) {
    var token = $("meta[name='csrf-token']").attr("content");
    xhr.setRequestHeader("X-CSRF-Token", token);
  });

  $("#datatable").DataTable({
    fixedHeader: true,
    stateSave: true,
    stateDuration: 1200,
    responsive: "true",
    dom: var_dom,
    language: espaniol,
    lengthChange: true,
    select: true,
    order: [0, "desc"],
    buttons: [
      {
        text: 'CSV <i class="fas fa-file-csv"></i> ',
        extend: "csvHtml5",
        fieldSeparator: "\t",
        extension: ".csv",
        titleAttr: "Si desea exportar el archivo, Dar click en CSV",
        className: "btn btn-outline-warning",
      },
      {
        text: 'EXCEL <i class="fas fa-file-excel"></i> ',
        extend: "csvHtml5",
        fieldSeparator: "\t",
        extension: ".xlsx",
        titleAttr: "Si desea exportar el archivo, Dar click en EXCEL",
        className: "btn btn-outline-success",
        messageTop: "La exportación excel, se ha realizado correctamente",
      },
      {
        text: 'PDF <i class="fas fa-file-pdf"></i> ',
        extend: "pdfHtml5",
        titleAttr: "Si desea exportar el archivo, Dar click en PDF",
        className: "btn btn-outline-danger",
        messageTop: "PDF created by PDFMake with Buttons for DataTables.",
      },
      {
        text: 'PRINT <i class="fas fa-print"></i> ',
        extend: "print",
        titleAttr: "Si desea imprimr, Dar click en PRINT",
        className: "btn btn-outline-info",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        text: "JSON",
        titleAttr: "Si desea exportar el archivo, Dar click en JSON",
        className: "btn btn-outline-primary",
        action: function (e, dt, button, config) {
          var data = dt.buttons.exportData();

          $.fn.dataTable.fileSave(
            new Blob([JSON.stringify(data)]),
            "Export.json"
          );
        },
      },
    ],
    pagingType: "full_numbers",
  });

  $("#opcion-ca-datatable").DataTable({
    fixedHeader: true,
    stateSave: true,
    stateDuration: 1200,
    responsive: "true",
    dom: var_dom,
    language: espaniol,
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#opcion-ca-datatable").data("source"),
    },
    order: [0, "desc"],
    buttons: [
      {
        text: 'CSV <i class="fas fa-file-csv"></i> ',
        extend: "csvHtml5",
        fieldSeparator: "\t",
        extension: ".csv",
        titleAttr: "Si desea exportar el archivo, Dar click en CSV",
        className: "btn btn-outline-warning",
      },
      {
        text: 'EXCEL <i class="fas fa-file-excel"></i> ',
        extend: "csvHtml5",
        fieldSeparator: "\t",
        extension: ".xlsx",
        titleAttr: "Si desea exportar el archivo, Dar click en EXCEL",
        className: "btn btn-outline-success",
        messageTop: "La exportación excel, se ha realizado correctamente",
      },
      {
        text: 'PDF <i class="fas fa-file-pdf"></i> ',
        extend: "pdfHtml5",
        titleAttr: "Si desea exportar el archivo, Dar click en PDF",
        className: "btn btn-outline-danger",
        messageTop: "PDF created by PDFMake with Buttons for DataTables.",
      },
      {
        text: 'PRINT <i class="fas fa-print"></i> ',
        extend: "print",
        titleAttr: "Si desea imprimr, Dar click en PRINT",
        className: "btn btn-outline-info",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        text: "JSON",
        titleAttr: "Si desea exportar el archivo, Dar click en JSON",
        className: "btn btn-outline-primary",
        action: function (e, dt, button, config) {
          var data = dt.buttons.exportData();

          $.fn.dataTable.fileSave(
            new Blob([JSON.stringify(data)]),
            "Export.json"
          );
        },
      },
    ],
    pagingType: "full_numbers",
    columns: [
      { data: "id" },
      { data: "opcion" },
      { data: "componente" },
      { data: "atributo" },
      { data: "descripcion" },
      { data: "estado" },
      { data: "editar" },
      { data: "inactivar" },
    ],
  });

  /* *******************************************************
   * Para controlar el sidebar en posición cerrado o abierto
   * ******************************************************** */
  let sidebarState = sessionStorage.getItem("sidebar");
  $(".sidebar").toggleClass(sidebarState);

  $("#sidebarToggle, #sidebarToggleTop").on("click", function (e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      sessionStorage.setItem("sidebar", "toggled");
      $(".sidebar .collapse").collapse("hide");
    } else {
      sessionStorage.setItem("sidebar", "");
    }
  });

  // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 768px
  if ($(window).width() < 768) {
    $(".sidebar .collapse").collapse("hide");
  }

  // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 480px
  if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
    $("body").addClass("sidebar-toggled");
    $(".sidebar").addClass("toggled");
    $(".sidebar .collapse").collapse("hide");
  }

  if (sidebarState === "toggled") {
    $(".menu_sb").addClass("collapsed");
    $(".opcion_sb").removeClass("show");
  }
  /* *******************************************************
   * Fin para controlar el sidebar en posición cerrado o abierto
   * ******************************************************** */

  // Configuracion de Scroll Top Button
  $(window).scroll(function () {
    if ($(this).scrollTop() > 40) {
      $("#topBtn").fadeIn();
    } else {
      $("#topBtn").fadeOut();
    }
  });

  $("#topBtn").click(function () {
    $("html ,body").animate(
      {
        scrollTop: 0,
      },
      800
    );
  });

  // Configuracion para activar select2
  $(".select2").select2({
    theme: "bootstrap4",
    language: "es-GT",
    width: "100%",
  });

  // Configuracion para activar select2
  $(".select2-empresa").select2({
    theme: "bootstrap4",
    language: "es-GT",
    width: "100%",
  });

  // Configuracion para activar select2
  $(".select2-area").select2({
    theme: "bootstrap4",
    language: "es-GT",
    width: "100%",
  });

  //funcion para los mensajes de los toggle en las tablas
  $(function () {
    $('[data-toggle="popover"]').popover();
  });

  //control de los tiempos de los flash
  $(".alert")
    .fadeTo(4000, 500)
    .slideUp(500, function () {
      $(".alert").slideUp(4000);
    });

  $('.add_permisos_perfil_id').hide();
  $('.add_permisos_opcion_id').hide();

  $('[name="add_permisos[options]"]').on('change', function () {
      if ($(this).val() == '0') {
          $('.add_permisos_perfil_id').show();
          $('.add_permisos_opcion_id').hide();
          $('#add_permisos_perfil_id').attr("required", true);
          $('#add_permisos_opcion_id').removeAttr('required');
      } else {
          $('.add_permisos_perfil_id').hide();
          $('.add_permisos_opcion_id').show();
          $('#add_permisos_perfil_id').removeAttr('required');
          $('#add_permisos_opcion_id').attr("required", true);
      }
  });

  //BUSCADOR USUARIOS
  $(".select2-usuario").select2({
    ajax: {
      url: $(".select2-usuario").data("endpoint"),
      dataType: "json",
      delay: 500,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page,
        };
      },
      processResults: function (data, page) {
        return {
          //results: data
          results: $.map(data, function (value, index) {
            return {
              id: value.valor_id,
              text: value.valor_text,
            };
          }),
        };
      },
    },
    minimumInputLength: 3,
    theme: "bootstrap4",
    language: "es-GT",
    width: "100%",
  });

  $("#usuario_selected_id").on("select2:select", function (e) {
    $.ajax({
      url: $(".path_search_area_empresa_p").data("endpoint"),
      type: "GET",
      dataType: "json",
      data: {
        area_empresa_persona_id_param: e.params.data.id,
      },
      success: function (data) {
        $("#area_empresa_persona_id").empty();
        var json = data;
        for (var i of json) {
          $("#area_empresa_persona_id").append(
            "<option value='" + i.id + "'>" + i.area + "</option>"
          );
        }
      },
    });
  });

  //funcion para seleccionar los permisos por perfil
  $(".select2-perfil").on("select2:select", function (e) {
    $.ajax({
      url: $(".path_opciones_perfil").data("endpoint"),
      type: "GET",
      dataType: "json",
      data: {
        role_id: e.params.data.id,
      },
      success: function (data) {
        if (data.response == "1") {
          $("#rowFormularios").html(data.data);
          $("#divOpciones").show();
        } else {
          $("#rowFormularios").html("");
          $("#divOpciones").hide();
        }
      },
    });
  });

  //funcion para seleccionar los permisos individualmente
  $(".select2-individual").on("select2:select", function (e) {
    $.ajax({
      url: $(".path_opciones_individual").data("endpoint"),
      type: "GET",
      dataType: "json",
      data: {
        opcion_id: e.params.data.id,
      },
      success: function (data) {
        if (data.response == "1") {
          $("#rowFormularios").html(data.data);
          $("#divOpciones").show();
        } else {
          $("#rowFormularios").html("");
          $("#divOpciones").hide();
        }
      },
    });
  });

  
});

import "controllers";

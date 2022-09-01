import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = { confirmTitle: String,
                    confirmText: String,
                    cancelText: String,
                    cancelTitle: String }

  connect() {
    this.redirect = false;
  }

  procesoSatisfechoCenter(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Excelente',
      html: 'You clicked the button!',
      icon: 'success',
      position: 'center',
      timer: 1500,
      timerProgressBar: false,
      backdrop: true,
      confirmButtonColor: "#1c7a1e",
      showConfirmButton: false
    })
  }

  procesoAlertaCenter(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Alerta',
      html: 'Something went wrong!',
      icon: 'warning',
      position: 'center',
      timer: 1500,
      timerProgressBar: false,
      backdrop: true,
      confirmButtonColor: "#d09701",
      showConfirmButton: false
    })
  }

  procesoCanceladoCenter(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Cancelado',
      html: 'Something went wrong!',
      icon: 'error',
      position: 'center',
      timer: 1500,
      timerProgressBar: false,
      backdrop: true,
      confirmButtonColor: "#d33",
      showConfirmButton: false
    })
  }

  procesoSatisfechoTopEnd(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Excelente',
      html: 'You clicked the button!',
      icon: 'success',
      position: 'top-end',
      timer: 1500,
      timerProgressBar: false,
      backdrop: true,
      confirmButtonColor: "#1c7a1e",
      showConfirmButton: false
    })
  }

  procesoAlertaTopEnd(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Alerta',
      html: 'Something went wrong!',
      icon: 'warning',
      position: 'top-end',
      timer: 1500,
      timerProgressBar: false,
      backdrop: true,
      confirmButtonColor: "#d09701",
      showConfirmButton: false
    })
  }

  procesoCanceladoTopEnd(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Cancelado',
      html: 'Something went wrong!',
      icon: 'error',
      position: 'top-end',
      timer: 1500,
      timerProgressBar: false,
      backdrop: true,
      confirmButtonColor: "#d33",
      showConfirmButton: false
    })
  }

  procesoSatisfechoTopEndToast(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })
    Toast.fire({
      icon: 'success',
      title: 'Signed in successfully'
    })
  }

  procesoAlertaTopEndToast(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })
    Toast.fire({
      icon: 'warning',
      title: 'Signed in successfully'
    })
  }

  procesoCanceladoTopEndToast(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })
    Toast.fire({
      icon: 'error',
      title: 'Signed in successfully'
    })
  }

  btnInactivar(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: true
    })

    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      html: this.confirmTitleValue,
      icon: 'warning',
      toast: false,
      position: 'center',
      backdrop: false,
      background: "white",
      timer: 5000,
      timerProgressBar: true,
      showCancelButton: true,
      confirmButtonColor: "#1c7a1e",
      cancelButtonColor: "#d33",
      confirmButtonText: this.confirmTextValue,
      cancelButtonText: this.cancelTextValue,
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire({
          title: 'Cancelado',
          html: this.cancelTitleValue,
          icon: 'error',
          toast: false,
          backdrop: false,
          background: "white",
          timer: 5000,
          timerProgressBar: true
        })
      }
    })
  }

  btnConfirmar(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: true
    })

    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      html: this.confirmTitleValue,
      icon: 'warning',
      toast: false,
      position: 'center',
      backdrop: false,
      background: "white",
      timer: 5000,
      timerProgressBar: true,
      showCancelButton: true,
      confirmButtonColor: "#1c7a1e",
      cancelButtonColor: "#d33",
      confirmButtonText: this.confirmTextValue,
      cancelButtonText: this.cancelTextValue,
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire({
          title: 'Cancelado',
          html: this.cancelTitleValue,
          icon: 'error',
          toast: false,
          backdrop: false,
          background: "white",
          timer: 5000,
          timerProgressBar: true
        })
      }
    })
  }

  btnInactivarToast(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: true
    })

    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      html: this.confirmTitleValue,
      icon: 'warning',
      toast: true,
      position: 'center',
      backdrop: false,
      background: "white",
      timer: 5000,
      timerProgressBar: true,
      showCancelButton: true,
      confirmButtonColor: "#1c7a1e",
      cancelButtonColor: "#d33",
      confirmButtonText: this.confirmTextValue,
      cancelButtonText: this.cancelTextValue,
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire({
          title: 'Cancelado',
          html: this.cancelTitleValue,
          icon: 'error',
          toast: true,
          backdrop: false,
          background: "white",
          timer: 5000,
          timerProgressBar: true
        })
      }
    })
  }

  btnConfirmarToast(event){
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: true
    })

    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      html: this.confirmTitleValue,
      icon: 'warning',
      toast: true,
      position: 'center',
      backdrop: false,
      background: "white",
      timer: 5000,
      timerProgressBar: true,
      showCancelButton: true,
      confirmButtonColor: "#1c7a1e",
      cancelButtonColor: "#d33",
      confirmButtonText: this.confirmTextValue,
      cancelButtonText: this.cancelTextValue,
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire({
          title: 'Cancelado',
          html: this.cancelTitleValue,
          icon: 'error',
          toast: true,
          backdrop: false,
          background: "white",
          timer: 5000,
          timerProgressBar: true
        })
      }
    })
  }

}

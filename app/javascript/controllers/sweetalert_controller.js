import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = { title: String,
                    confirmText: String,
                    cancelText: String }

  connect() {
    this.redirect = false;
  }

  showAlert(event){
    if (this.redirect) return;

    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'ALERTA',
      text: this.titleValue,
      icon: 'info',
      backdrop: false,
      background: "white",
      confirmButtonColor: "#1c7a1e",
      timer: 5000,
      timerProgressBar: true,
      toast: false,
      position: 'center',
      allowOutsideClick: false,
      allowEscapeKey: false,
      allowEnterKey: false,
      stopKeydownPropagation: false,
      buttonsStyling: true,
      showCloseButton: true,
      reverseButtons: true,
      focusConfirm: false,
      focusCancel: true,
      //showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: this.confirmTextValue,
      //denyButtonText: `Don't save`,
      cancelButtonText: this.cancelTextValue,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
        //Swal.fire('Saved!', '', 'success')
      } else if (result.isDenied) {
        //Swal.fire('Changes are not saved', '', 'info')
      }
    });
  }
}

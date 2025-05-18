/* jshint esversion: 8 */
/* jshint browser: true */
/* globals bootstrap */

/**
 * Validación de formulario para árboles
 * - Maneja validación en tiempo real
 * - Previene envío si hay errores
 * - Muestra feedback claro al usuario
 */

document.addEventListener('DOMContentLoaded', function() {
  'use strict';

  const form = document.getElementById('treeForm');
  let errorModal = null;

  // Inicializar modal si existe
  const modalEl = document.getElementById('errorModal');
  if (modalEl) {
    errorModal = new bootstrap.Modal(modalEl);
  }

  // Configurar validación en tiempo real
  setupLiveValidation();

  // Manejar envío del formulario
  if (form) {
    form.addEventListener('submit', function(event) {
      event.preventDefault();
      clearErrors();

      if (validateForm()) {
        form.submit();
      } else {
        showErrorModal(errorModal);
      }
    });
  }
});

// ============ VALIDACIÓN GENERAL ============

function validateForm() {
  let isValid = true;

  // Campos requeridos con validación numérica/custom
  isValid = validateField('species', 'La especie es requerida y solo puede contener letras.') && isValid;
  isValid = validateField('height', 'La altura debe ser entre 0.1 y 115.72 m.', value => value >= 0.1 && value <= 115.72) && isValid;
  isValid = validateField('age', 'La edad debe ser entre 1 y 4850 años.', value => value >= 1 && value <= 4850) && isValid;

  // Validación de patrones HTML5
  isValid = validatePattern('location', 'La ubicación contiene caracteres no permitidos.') && isValid;
  isValid = validatePattern('scientificName', 'Nombre científico inválido (solo letras y puntos).') && isValid;

  // Validación de fecha
  isValid = validateDate('plantedDate', 'La fecha no puede ser futura.') && isValid;

  return isValid;
}

// ============ FUNCIONES DE VALIDACIÓN ESPECÍFICA ============

function validateField(id, message, customFn) {
  const field = document.getElementById(id);
  const errorEl = document.getElementById(id + 'Error');
  if (!field || !errorEl) return false;

  const val = field.value.trim();
  let ok = true;

  if (!val) {
    ok = false;
  } else if (customFn && !customFn(parseFloat(val))) {
    ok = false;
  }

  errorEl.textContent = ok ? '' : message;
  return ok;
}

function validatePattern(id, message) {
  const field = document.getElementById(id);
  const errorEl = document.getElementById(id + 'Error');
  if (!field || !errorEl) return true;

  if (field.value && !field.checkValidity()) {
    errorEl.textContent = message;
    return false;
  }
  errorEl.textContent = '';
  return true;
}

function validateDate(id, message) {
  const field = document.getElementById(id);
  const errorEl = document.getElementById(id + 'Error');
  if (!field || !errorEl) return true;

  if (!field.value) {
    errorEl.textContent = '';
    return true;
  }

  const today = new Date();
  const input = new Date(field.value);
  const ok = input <= today;
  errorEl.textContent = ok ? '' : message;
  return ok;
}

// ============ VALIDACIÓN EN TIEMPO REAL ============

function setupLiveValidation() {
  document.querySelectorAll('#treeForm input, #treeForm textarea').forEach(input => {
    input.addEventListener('input', () => {
      const errEl = document.getElementById(input.id + 'Error');
      if (errEl) {
        errEl.textContent = input.checkValidity() ? '' : 'Valor inválido';
      }
    });
  });
}

// ============ UTILIDADES ============

function clearErrors() {
  document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
}

function showErrorModal(modalInstance) {
  const msgEl = document.getElementById('modalErrorMessage');
  if (msgEl) {
    msgEl.textContent = 'Por favor corrige los errores marcados en rojo.';
  }
  if (modalInstance) {
    modalInstance.show();
  }
}

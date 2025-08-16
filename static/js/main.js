// Main JavaScript for SPARK & HQ1 Inventory System

let currentStream = null;
let barcodeScanner = null;
let currentBarcodeCallback = null;

document.addEventListener('DOMContentLoaded', function() {
    initializeBarcodeModal();
    setupKeyboardListeners();
    initializeTooltips();
});

// Initialize barcode scanner modal
function initializeBarcodeModal() {
    const barcodeModal = document.getElementById('barcodeModal');
    const startCameraBtn = document.getElementById('start-camera');
    const stopCameraBtn = document.getElementById('stop-camera');
    const manualBarcodeInput = document.getElementById('manual-barcode');
    const useBarcodeBtn = document.getElementById('use-barcode');

    if (!barcodeModal) return;

    // Modal events
    barcodeModal.addEventListener('shown.bs.modal', function() {
        manualBarcodeInput.focus();
    });

    barcodeModal.addEventListener('hidden.bs.modal', function() {
        stopCamera();
        clearBarcodeResult();
    });

    // Camera controls
    if (startCameraBtn) {
        startCameraBtn.addEventListener('click', startCamera);
    }

    if (stopCameraBtn) {
        stopCameraBtn.addEventListener('click', stopCamera);
    }

    // Manual barcode input
    if (manualBarcodeInput) {
        manualBarcodeInput.addEventListener('input', function() {
            if (this.value.trim()) {
                showBarcodeResult(this.value.trim());
            } else {
                clearBarcodeResult();
            }
        });

        manualBarcodeInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                if (this.value.trim()) {
                    useBarcode(this.value.trim());
                }
            }
        });
    }

    // Use barcode button
    if (useBarcodeBtn) {
        useBarcodeBtn.addEventListener('click', function() {
            const barcode = manualBarcodeInput.value.trim();
            if (barcode) {
                useBarcode(barcode);
            }
        });
    }
}

// Start camera for barcode scanning
function startCamera() {
    if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
        alert('Camera not supported on this device');
        return;
    }

    const cameraElement = document.getElementById('camera');
    if (!cameraElement) return;

    navigator.mediaDevices.getUserMedia({ 
        video: { 
            facingMode: 'environment',
            width: { ideal: 640 },
            height: { ideal: 480 }
        } 
    })
    .then(function(stream) {
        currentStream = stream;
        cameraElement.srcObject = stream;
        cameraElement.play();

        // Initialize QuaggaJS for barcode scanning
        if (typeof Quagga !== 'undefined') {
            initializeQuagga();
        }

        updateCameraButtons(true);
    })
    .catch(function(error) {
        console.error('Error accessing camera:', error);
        alert('Failed to access camera: ' + error.message);
    });
}

// Stop camera
function stopCamera() {
    if (currentStream) {
        currentStream.getTracks().forEach(track => track.stop());
        currentStream = null;
    }

    if (barcodeScanner) {
        Quagga.stop();
        barcodeScanner = null;
    }

    const cameraElement = document.getElementById('camera');
    if (cameraElement) {
        cameraElement.srcObject = null;
    }

    updateCameraButtons(false);
}

// Initialize QuaggaJS barcode scanner
function initializeQuagga() {
    if (typeof Quagga === 'undefined') return;

    Quagga.init({
        inputStream: {
            name: "Live",
            type: "LiveStream",
            target: document.querySelector('#camera'),
            constraints: {
                width: 640,
                height: 480,
                facingMode: "environment"
            }
        },
        decoder: {
            readers: [
                "code_128_reader",
                "ean_reader",
                "ean_8_reader",
                "code_39_reader",
                "code_39_vin_reader",
                "codabar_reader",
                "upc_reader",
                "upc_e_reader",
                "i2of5_reader"
            ]
        }
    }, function(err) {
        if (err) {
            console.error('QuaggaJS initialization error:', err);
            return;
        }
        
        console.log("QuaggaJS initialization finished. Ready to start");
        Quagga.start();
        barcodeScanner = true;

        // Add scanning overlay
        addScanningOverlay();
    });

    // Listen for barcode detection
    Quagga.onDetected(function(result) {
        const code = result.codeResult.code;
        console.log('Barcode detected:', code);
        
        // Fill manual input
        const manualInput = document.getElementById('manual-barcode');
        if (manualInput) {
            manualInput.value = code;
            showBarcodeResult(code);
        }

        // Auto-use barcode after detection
        setTimeout(() => {
            useBarcode(code);
        }, 1000);
    });
}

// Add scanning overlay to camera
function addScanningOverlay() {
    const cameraContainer = document.getElementById('camera-container');
    if (!cameraContainer || cameraContainer.querySelector('.barcode-overlay')) return;

    const overlay = document.createElement('div');
    overlay.className = 'barcode-overlay';
    cameraContainer.appendChild(overlay);
}

// Update camera button states
function updateCameraButtons(cameraActive) {
    const startBtn = document.getElementById('start-camera');
    const stopBtn = document.getElementById('stop-camera');

    if (startBtn) {
        startBtn.disabled = cameraActive;
    }
    if (stopBtn) {
        stopBtn.disabled = !cameraActive;
    }
}

// Show barcode result
function showBarcodeResult(barcode) {
    const resultDiv = document.getElementById('barcode-result');
    if (resultDiv) {
        resultDiv.innerHTML = `
            <div class="alert alert-success">
                <strong>Código detectado:</strong><br>
                <code style="font-size: 1.1em;">${barcode}</code>
            </div>
        `;
    }
}

// Clear barcode result
function clearBarcodeResult() {
    const resultDiv = document.getElementById('barcode-result');
    if (resultDiv) {
        resultDiv.innerHTML = '';
    }
}

// Use barcode (close modal and send to parent)
function useBarcode(barcode) {
    // Close modal
    const modal = bootstrap.Modal.getInstance(document.getElementById('barcodeModal'));
    if (modal) {
        modal.hide();
    }

    // Send barcode to any listening components
    const event = new CustomEvent('barcodeScanned', {
        detail: { barcode: barcode }
    });
    window.dispatchEvent(event);

    // If there's a specific callback, use it
    if (currentBarcodeCallback) {
        currentBarcodeCallback(barcode);
        currentBarcodeCallback = null;
    }
}

// Set barcode callback for specific use
function setBarcodeCallback(callback) {
    currentBarcodeCallback = callback;
}

// Keyboard shortcuts
function setupKeyboardListeners() {
    document.addEventListener('keydown', function(e) {
        // Ctrl+B for barcode scanner
        if (e.ctrlKey && e.key === 'b') {
            e.preventDefault();
            const barcodeModal = document.getElementById('barcodeModal');
            if (barcodeModal) {
                const modal = new bootstrap.Modal(barcodeModal);
                modal.show();
            }
        }

        // Escape to close modals
        if (e.key === 'Escape') {
            const modals = document.querySelectorAll('.modal.show');
            modals.forEach(modal => {
                const modalInstance = bootstrap.Modal.getInstance(modal);
                if (modalInstance) {
                    modalInstance.hide();
                }
            });
        }
    });
}

// Initialize tooltips
function initializeTooltips() {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
}

// Utility functions
function showAlert(message, type = 'info', duration = 5000) {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
    alertDiv.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

    const container = document.querySelector('main .container-fluid') || document.querySelector('main');
    if (container) {
        container.insertBefore(alertDiv, container.firstChild);
        
        setTimeout(() => {
            if (alertDiv.parentNode) {
                alertDiv.remove();
            }
        }, duration);
    }
}

function showLoading(element) {
    if (element) {
        element.classList.add('loading');
        const spinner = document.createElement('span');
        spinner.className = 'spinner-border spinner-border-sm me-2';
        spinner.setAttribute('role', 'status');
        element.insertBefore(spinner, element.firstChild);
    }
}

function hideLoading(element) {
    if (element) {
        element.classList.remove('loading');
        const spinner = element.querySelector('.spinner-border');
        if (spinner) {
            spinner.remove();
        }
    }
}

// Format currency
function formatCurrency(value) {
    if (value === null || value === undefined) return '-';
    return new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL'
    }).format(value);
}

// Format date
function formatDate(dateString) {
    if (!dateString) return '-';
    const date = new Date(dateString);
    return date.toLocaleDateString('pt-BR');
}

// Debounce function for search inputs
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Export functions for global use
window.InventorySystem = {
    showAlert,
    showLoading,
    hideLoading,
    formatCurrency,
    formatDate,
    debounce,
    setBarcodeCallback,
    startCamera,
    stopCamera
};
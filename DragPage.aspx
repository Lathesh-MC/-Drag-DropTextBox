<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DragPage.aspx.vb" Inherits="DragControls.DragPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>General Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .capitalize { text-transform: capitalize; }
        .required::after { content: " *"; color: #dc3545; }
        .error-msg { color: #dc3545; font-size: 0.85rem; margin-top: 2px; display: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="form-group col-md-4">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control user-name required" />
        </div>

        <div class="form-group col-md-4">
            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control user-mobile required" />
        </div>

        <div class="form-group col-md-4">
            <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control user-regno required" />
        </div>

        <div class="form-group col-md-4">
            <asp:TextBox ID="txtSATSNo" runat="server" CssClass="form-control user-satsno required" />
        </div>

        <div class="form-group col-md-4">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control user-email required" />
        </div>

      <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />


        <script type="text/javascript">




            document.addEventListener('DOMContentLoaded', () => {
                const form = document.querySelector('form');

                const fields = [
                    {
                        selector: 'input.user-name',
                        label: 'Name',
                        placeholder: 'Enter Your Name',
                        maxLength: 30,
                        validate: val => /^[a-zA-Z ]+(\.?[a-zA-Z ]+)*$/.test(val.trim()) && val.trim() !== '',
                        format: val =>
                            val.replace(/[^a-zA-Z. ]/g, '')
                                .replace(/\s+/g, ' ')
                                .replace(/\.{2,}/g, '.')
                                .replace(/^\./, '')
                                .replace(/(^\w|[\s.]\w)/g, c => c.toUpperCase()),
                        errorMsg: 'Name is required and must contain only letters, spaces or periods.'
                    },
                    {
                        selector: 'input.user-mobile',
                        label: 'Mobile',
                        placeholder: '10-digit number',
                        maxLength: 10,
                        validate: val => /^\d{10}$/.test(val.trim()),
                        format: val => val.replace(/\D/g, '').slice(0, 10),
                        errorMsg: 'Please enter a valid 10-digit mobile number.'
                    },
                    {
                        selector: 'input.user-regno',
                        label: 'Registration No',
                        placeholder: '12-digit Registration No',
                        maxLength: 12,
                        validate: val => /^\d{12}$/.test(val.trim()),
                        format: val => val.replace(/\D/g, '').slice(0, 12),
                        errorMsg: 'Please enter a valid 12-digit registration number.'
                    },
                    {
                        selector: 'input.user-satsno',
                        label: 'SATS No',
                        placeholder: '6-digit SATS No',
                        maxLength: 6,
                        validate: val => /^\d{6}$/.test(val.trim()),
                        format: val => val.replace(/\D/g, '').slice(0, 6),
                        errorMsg: 'Please enter a valid 6-digit SATS No.'
                    },
                    {
                        selector: 'input.user-email',
                        label: 'Email',
                        placeholder: 'Enter Your valid Gmail address',
                        validate: val => /^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(val.trim()),
                        format: val => val.trim(),
                        errorMsg: 'Enter a valid Gmail address (e.g., abc@gmail.com)'
                    }
                ];

                fields.forEach(field => {
                    const inputs = document.querySelectorAll(field.selector);

                    inputs.forEach(input => {
                        const parent = input.closest('.form-group');

                        // Insert label if missing
                        if (parent && !parent.querySelector('label')) {
                            const label = document.createElement('label');
                            label.setAttribute('for', input.id);
                            label.className = input.classList.contains('required') ? 'required' : '';
                            label.textContent = field.label;
                            parent.insertBefore(label, input);
                        }

                        // Insert error message container
                        if (!parent.querySelector('.error-msg')) {
                            const error = document.createElement('div');
                            error.className = 'error-msg';
                            error.textContent = field.errorMsg;
                            parent.appendChild(error);
                        }

                        // Set placeholder and maxlength if defined
                        if (field.placeholder) input.setAttribute('placeholder', field.placeholder);
                        if (field.maxLength) input.setAttribute('maxlength', field.maxLength);

                        // Format input on typing
                        input.addEventListener('input', () => {
                            input.value = field.format(input.value);
                        });

                        // Optional keypress restriction
                        if (field.selector.includes('user-mobile') ||
                            field.selector.includes('user-regno') ||
                            field.selector.includes('user-satsno')) {
                            input.addEventListener('keypress', evt => {
                                const code = evt.which || evt.keyCode;
                                if ([8, 9, 37, 39].includes(code)) return true;
                                if (code < 48 || code > 57) return false;
                            });
                        }

                        // Email blur validation
                        if (field.selector.includes('user-email')) {
                            input.addEventListener('blur', () => {
                                const error = parent.querySelector('.error-msg');
                                error.style.display = field.validate(input.value) ? 'none' : 'block';
                            });
                        }
                    });
                });

                // Unified form validation on submit
                if (form) {
                    form.addEventListener('submit', function (e) {
                        let isValid = true;

                        fields.forEach(field => {
                            const inputs = document.querySelectorAll(field.selector);

                            inputs.forEach(input => {
                                const parent = input.closest('.form-group');
                                const error = parent.querySelector('.error-msg');

                                if (input.classList.contains('required') && !field.validate(input.value)) {
                                    error.style.display = 'block';
                                    isValid = false;
                                } else {
                                    error.style.display = 'none';
                                }
                            });
                        });

                        if (!isValid) e.preventDefault();
                    });
                }
            });

            //Name Validation (user-name)
            //document.addEventListener('DOMContentLoaded', () => {
            //    const userInputs = document.querySelectorAll('input.user-name');

            //    userInputs.forEach(input => {
            //        const parent = input.closest('.form-group');

            //        // Insert label manually if missing
            //        if (parent && !parent.querySelector('label')) {
            //            const label = document.createElement('label');
            //            label.setAttribute('for', input.id);
            //            label.className = input.classList.contains('required') ? 'required' : '';
            //            label.textContent = 'Name';
            //            parent.insertBefore(label, input);
            //        }

            //        // Insert error message span if missing
            //        if (!parent.querySelector('.error-msg')) {
            //            const error = document.createElement('div');
            //            error.className = 'error-msg';
            //            error.textContent = 'Name is required.';
            //            parent.appendChild(error);
            //        }

            //        input.placeholder = 'Enter Your Name';
            //        input.classList.add('capitalize');
            //        input.setAttribute('maxlength', '30');

            //        // Keypress filter
            //        input.addEventListener('keypress', evt => {
            //            const code = evt.which || evt.keyCode;
            //            const char = String.fromCharCode(code);
            //            const val = input.value;
            //            const pos = input.selectionStart;

            //            if ([8, 9, 37, 39].includes(code)) return true; // control keys
            //            if (!/[a-zA-Z .]/.test(char)) return false;     // only alphabets, space, dot
            //            if (char === '.' && (pos === 0 || val[pos - 1] === '.')) return false;

            //            return true;
            //        });

            //        // Format and sanitize input
            //        input.addEventListener('input', () => {
            //            let val = input.value;

            //            val = val.replace(/[^a-zA-Z. ]/g, '')      // remove digits & special characters
            //                .replace(/\s+/g, ' ')             // single spaces
            //                .replace(/\.{2,}/g, '.')          // single dots
            //                .replace(/^\./, '')               // no starting dot
            //                .replace(/(^\w|[\s.]\w)/g, c => c.toUpperCase()); // capitalize

            //            input.value = val;
            //        });
            //    });

            //    // On submit validation
            //    const form = document.querySelector('form');
            //    if (form) {
            //        form.addEventListener('submit', function (e) {
            //            let isValid = true;

            //            userInputs.forEach(input => {
            //                const parent = input.closest('.form-group');
            //                const errorMsg = parent.querySelector('.error-msg');

            //                if (input.classList.contains('required') && input.value.trim() === '') {
            //                    errorMsg.style.display = 'block';
            //                    isValid = false;
            //                } else {
            //                    errorMsg.style.display = 'none';
            //                }
            //            });

            //            if (!isValid) {
            //                e.preventDefault(); // stop form submission
            //            }
            //        });
            //    }
            ////});








            //Mobile Validation (user-mobile)
            //document.addEventListener('DOMContentLoaded', () => {
            //    const mobileInputs = document.querySelectorAll('input.user-mobile');

            //    mobileInputs.forEach(input => {
            //        const parent = input.closest('.form-group');

            //        // Insert label if not already present
            //        if (parent && !parent.querySelector('label')) {
            //            const label = document.createElement('label');
            //            label.setAttribute('for', input.id);
            //            label.className = input.classList.contains('required') ? 'required' : '';
            //            label.textContent = 'Mobile';
            //            parent.insertBefore(label, input);
            //        }

            //        // Insert error message if not present
            //        if (!parent.querySelector('.error-msg')) {
            //            const error = document.createElement('div');
            //            error.className = 'error-msg';
            //            error.textContent = 'Please enter a valid 10-digit mobile number.';
            //            parent.appendChild(error);
            //        }

            //        input.setAttribute('maxlength', '10');
            //        input.setAttribute('placeholder', '10-digit number');

            //        // Allow only numeric input
            //        input.addEventListener('keypress', evt => {
            //            const code = evt.which || evt.keyCode;

            //            if ([8, 9, 37, 39].includes(code)) return true; // Allow control keys
            //            if (code < 48 || code > 57) return false;      // Block non-digits

            //            return true;
            //        });

            //        // Remove non-digit characters on input (pasting protection)
            //        input.addEventListener('input', () => {
            //            input.value = input.value.replace(/\D/g, '').slice(0, 10);
            //        });
            //    });

            //    // Form submission validation
            //    const form = document.querySelector('form');
            //    if (form) {
            //        form.addEventListener('submit', function (e) {
            //            let isValid = true;

            //            mobileInputs.forEach(input => {
            //                const parent = input.closest('.form-group');
            //                const errorMsg = parent.querySelector('.error-msg');

            //                if (input.classList.contains('required') && input.value.trim().length !== 10) {
            //                    errorMsg.style.display = 'block';
            //                    isValid = false;
            //                } else {
            //                    errorMsg.style.display = 'none';
            //                }
            //            });

            //            if (!isValid) {
            //                e.preventDefault(); // stop form submission
            //            }
            //        });
            //    }
            ////})








            //Registration No validation (user-regno)
            //document.addEventListener('DOMContentLoaded', () => {
            //    const regInputs = document.querySelectorAll('input.user-regno');

            //    regInputs.forEach(input => {
            //        const parent = input.closest('.form-group');

            //        // Insert label if missing
            //        if (parent && !parent.querySelector('label')) {
            //            const label = document.createElement('label');
            //            label.setAttribute('for', input.id);
            //            label.className = input.classList.contains('required') ? 'required' : '';
            //            label.textContent = 'Registration No';
            //            parent.insertBefore(label, input);
            //        }

            //        // Insert error message if missing
            //        if (!parent.querySelector('.error-msg')) {
            //            const error = document.createElement('div');
            //            error.className = 'error-msg';
            //            error.textContent = 'Please enter a valid 12-digit registration number.';
            //            parent.appendChild(error);
            //        }

            //        input.setAttribute('maxlength', '12');
            //        input.setAttribute('placeholder', '12-digit Registration No');

            //        // Allow only number input
            //        input.addEventListener('keypress', evt => {
            //            const code = evt.which || evt.keyCode;

            //            if ([8, 9, 37, 39].includes(code)) return true; // Allow control keys
            //            if (code < 48 || code > 57) return false;      // Block non-digits

            //            return true;
            //        });

            //        // Clean pasted input
            //        input.addEventListener('input', () => {
            //            input.value = input.value.replace(/\D/g, '').slice(0, 12);
            //        });
            //    });

            //    // Form submission validation
            //    const form = document.querySelector('form');
            //    if (form) {
            //        form.addEventListener('submit', function (e) {
            //            let isValid = true;

            //            regInputs.forEach(input => {
            //                const parent = input.closest('.form-group');
            //                const errorMsg = parent.querySelector('.error-msg');

            //                if (input.classList.contains('required') && input.value.trim().length !== 12) {
            //                    errorMsg.style.display = 'block';
            //                    isValid = false;
            //                } else {
            //                    errorMsg.style.display = 'none';
            //                }
            //            });

            //            if (!isValid) {
            //                e.preventDefault(); // stop form submission
            //            }
            //        });
            //    }
            ////});






            //SATS No validation (user-satsno)
            //document.addEventListener('DOMContentLoaded', () => {
            //    const satsInputs = document.querySelectorAll('input.user-satsno');

            //    satsInputs.forEach(input => {
            //        const parent = input.closest('.form-group');

            //        // Insert label if not already present
            //        if (parent && !parent.querySelector('label')) {
            //            const label = document.createElement('label');
            //            label.setAttribute('for', input.id);
            //            label.className = input.classList.contains('required') ? 'required' : '';
            //            label.textContent = 'SATS No';
            //            parent.insertBefore(label, input);
            //        }

            //        // Insert error message if not already present
            //        if (!parent.querySelector('.error-msg')) {
            //            const error = document.createElement('div');
            //            error.className = 'error-msg';
            //            error.textContent = 'Please enter a valid 6-digit SATS No.';
            //            parent.appendChild(error);
            //        }

            //        // Set input attributes
            //        input.setAttribute('maxlength', '6');
            //        input.setAttribute('placeholder', '6-digit SATS No');

            //        // Allow only numeric input
            //        input.addEventListener('keypress', evt => {
            //            const code = evt.which || evt.keyCode;
            //            if ([8, 9, 37, 39].includes(code)) return true; // control keys
            //            return (code >= 48 && code <= 57); // digits only
            //        });

            //        // Clean pasted input
            //        input.addEventListener('input', () => {
            //            input.value = input.value.replace(/\D/g, '').slice(0, 6);
            //        });
            //    });

            //    // Validate on form submit
            //    const form = document.querySelector('form');
            //    if (form) {
            //        form.addEventListener('submit', function (e) {
            //            let isValid = true;

            //            satsInputs.forEach(input => {
            //                const parent = input.closest('.form-group');
            //                const errorMsg = parent.querySelector('.error-msg');

            //                if (input.classList.contains('required') && input.value.trim().length !== 6) {
            //                    errorMsg.style.display = 'block';
            //                    isValid = false;
            //                } else {
            //                    errorMsg.style.display = 'none';
            //                }
            //            });

            //            if (!isValid) {
            //                e.preventDefault(); // stop form submission
            //            }
            //        });
            //    }
            ////});






            //Email validation (user-email)
            //document.addEventListener('DOMContentLoaded', () => {
            //    const emailInputs = document.querySelectorAll('input.user-email');

            //    // Helper function to validate Gmail
            //    const isValidGmail = (email) => /^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(email.trim());

            //    emailInputs.forEach(input => {
            //        const parent = input.closest('.form-group');

            //        // Insert label if missing
            //        if (parent && !parent.querySelector('label')) {
            //            const label = document.createElement('label');
            //            label.setAttribute('for', input.id);
            //            label.className = input.classList.contains('required') ? 'required' : '';
            //            label.textContent = 'Email';
            //            parent.insertBefore(label, input);
            //        }

            //        // Insert error message if missing
            //        if (!parent.querySelector('.error-msg')) {
            //            const error = document.createElement('div');
            //            error.className = 'error-msg';
            //            error.textContent = 'Enter a valid Gmail address (e.g., abc@gmail.com)';
            //            parent.appendChild(error);
            //        }

            //        // Set placeholder
            //        input.setAttribute('placeholder', 'Enter Your valid Gmail address');

            //        // Validate on input blur
            //        input.addEventListener('blur', () => {
            //            const val = input.value.trim();
            //            const error = parent.querySelector('.error-msg');

            //            if (input.classList.contains('required') && !isValidGmail(val)) {
            //                error.style.display = 'block';
            //            } else {
            //                error.style.display = 'none';
            //            }
            //        });
            //    });

            //    // On form submit
            //    const form = document.querySelector('form');
            //    if (form) {
            //        form.addEventListener('submit', function (e) {
            //            let isValid = true;

            //            emailInputs.forEach(input => {
            //                const parent = input.closest('.form-group');
            //                const val = input.value.trim();
            //                const error = parent.querySelector('.error-msg');

            //                if (input.classList.contains('required') && !isValidGmail(val)) {
            //                    error.style.display = 'block';
            //                    isValid = false;
            //                } else {
            //                    error.style.display = 'none';
            //                }
            //            });

            //            if (!isValid) {
            //                e.preventDefault(); // prevent submission
            //            }
            //        });
            //    }
            ////});







        </script>

    </form>
</body>
</html>
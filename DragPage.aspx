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


        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <!-- TextBoxes without container -->
     <asp:TextBox ID="txtNamee" runat="server" CssClass="user-name required" />
        <asp:TextBox ID="txtMobilee" runat="server" CssClass="user-mobile required" />
        <asp:TextBox ID="TextBox1" runat="server" CssClass="user-email required" />

       <asp:TextBox ID="TextBox2" runat="server" CssClass="user-regno" />

       <asp:TextBox ID="TextBox3" runat="server" CssClass="user-satsno" />

        <!-- TextBoxes with container -->
        <div>
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
                        let parent = input.parentElement;

                        // If not already in form-group, wrap it
                        if (!parent.classList.contains('form-group')) {
                            const wrapper = document.createElement('div');
                            wrapper.className = 'form-group';
                            parent.insertBefore(wrapper, input);
                            wrapper.appendChild(input);
                            parent = wrapper;
                        }

                        // Insert label if missing
                        if (!parent.querySelector('label')) {
                            const label = document.createElement('label');
                            label.setAttribute('for', input.id);
                            label.className = input.classList.contains('required') ? 'required' : '';
                            label.textContent = field.label;
                            parent.insertBefore(label, input);
                        }

                        // Insert error message container if missing
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

                        // Keypress validation for number-only fields
                        if (field.selector.includes('user-mobile') ||
                            field.selector.includes('user-regno') ||
                            field.selector.includes('user-satsno')) {
                            input.addEventListener('keypress', evt => {
                                const code = evt.which || evt.keyCode;
                                if ([8, 9, 37, 39].includes(code)) return;
                                if (code < 48 || code > 57) evt.preventDefault();
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
                                const parent = input.parentElement;
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
        </script>
    </form>
</body>
</html>

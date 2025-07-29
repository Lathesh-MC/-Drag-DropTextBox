<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DragPage.aspx.vb" Inherits="DragControls.DragPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>General Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />


    <style>
        .capitalize { text-transform: capitalize; }
        label.required::after { content: " *"; color: #dc3545; }
        .error-msg { color: #dc3545; font-size: 0.85rem; margin-top: 2px; display: none; }
        .is-invalid { border-color: #dc3545; }

        .card {
    border-radius: 10px;
}

.card-header {
    border-radius: 10px 10px 0 0;
}

.form-control:focus {
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    border-color: #80bdff;
    transition: 0.3s;
}

.btn-success:hover {
    background-color: #218838;
    border-color: #1e7e34;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="successAlert" class="alert alert-success alert-dismissible fade show d-none" role="alert">
            Form submitted successfully!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>
        <div id="errorAlert" class="alert alert-danger alert-dismissible fade show d-none" role="alert">
            Please fill all required fields correctly.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
        </div>

       <!-- User Input Fields -->
     <%--   <asp:TextBox ID="TextBox1" runat="server" CssClass="user-name required" />
        <asp:TextBox ID="TextBox14" runat="server" CssClass="user-fathername required" />
        <asp:TextBox ID="TextBox13" runat="server" CssClass="user-mothername required" />
        <asp:TextBox ID="TextBox12" runat="server" CssClass="user-clg required" />
        <asp:TextBox ID="TextBox7" runat="server" CssClass="user-qualification required" />
        <asp:TextBox ID="TextBox10" runat="server" CssClass="user-boardsslc required" />
        <asp:TextBox ID="TextBox15" runat="server" CssClass="user-boardpuc required" />
        <asp:TextBox ID="TextBox11" runat="server" CssClass="user-mothertongue required" />
        <asp:TextBox ID="TextBox9" runat="server" CssClass="user-religion required" />

        <asp:TextBox ID="TextBox8" runat="server" CssClass="user-regnosslc required" />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="user-regnopuc required" />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="user-satsno required" />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="user-email required" />
        <asp:TextBox ID="TextBox5" runat="server" CssClass="user-dob required" />
        <asp:TextBox ID="TextBox6" runat="server" CssClass="user-mobile required" />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />--%>


        <div class="container mt-4">
              <noscript>
  <div class="alert alert-warning text-center">
    <strong>Warning!</strong> This form requires JavaScript to function properly. Please enable JavaScript in your browser.
  </div>
</noscript>
            <div class="card shadow-lg">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control user-name required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control user-fathername required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control user-mothername required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox19" runat="server" CssClass="form-control user-clg required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox20" runat="server" CssClass="form-control user-qualification required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control user-boardsslc required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox22" runat="server" CssClass="form-control user-boardpuc required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox23" runat="server" CssClass="form-control user-mothertongue required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox24" runat="server" CssClass="form-control user-religion required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox25" runat="server" CssClass="form-control user-regnosslc required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox26" runat="server" CssClass="form-control user-regnopuc required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox27" runat="server" CssClass="form-control user-satsno required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox28" runat="server" CssClass="form-control user-email required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox29" runat="server" CssClass="form-control user-dob required" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="TextBox30" runat="server" CssClass="form-control user-mobile required" />
                        </div>

                        <div class="col-12 text-center mt-3">
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-4 shadow-lg p-4 bg-white rounded">
              <noscript>
  <div class="alert alert-warning text-center">
    <strong>Warning!</strong> This form requires JavaScript to function properly. Please enable JavaScript in your browser.
  </div>
</noscript>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control user-name required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control user-fathername required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control user-mothername required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control user-clg required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control user-qualification required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control user-boardsslc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control user-boardpuc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control user-mothertongue required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control user-religion required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control user-regnosslc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control user-regnopuc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control user-satsno required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control user-email required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control user-dob required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control user-mobile required" />
                </div>

                <div class="col-12 text-center mt-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>

        <div class="container my-4">
              <noscript>
  <div class="alert alert-warning text-center">
    <strong>Warning!</strong> This form requires JavaScript to function properly. Please enable JavaScript in your browser.
  </div>
</noscript>
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">Student Registration Form</h4>
        </div>
        <div class="card-body bg-light">
            <div class="row">
                <!-- Personal Info -->
                <div class="col-12">
                    <h5 class="text-secondary border-bottom pb-2 mb-3">Personal Information</h5>
                </div>

                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox31" runat="server" CssClass="form-control user-name required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox32" runat="server" CssClass="form-control user-fathername required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox33" runat="server" CssClass="form-control user-mothername required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox34" runat="server" CssClass="form-control user-mothertongue required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox35" runat="server" CssClass="form-control user-religion required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox36" runat="server" CssClass="form-control user-dob required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox37" runat="server" CssClass="form-control user-mobile required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox38" runat="server" CssClass="form-control user-email required" />
                </div>

                <!-- Academic Info -->
                <div class="col-12 mt-4">
                    <h5 class="text-secondary border-bottom pb-2 mb-3">Academic Details</h5>
                </div>

                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox39" runat="server" CssClass="form-control user-clg required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox40" runat="server" CssClass="form-control user-qualification required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox41" runat="server" CssClass="form-control user-boardsslc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox42" runat="server" CssClass="form-control user-boardpuc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox43" runat="server" CssClass="form-control user-regnosslc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox44" runat="server" CssClass="form-control user-regnopuc required" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:TextBox ID="TextBox45" runat="server" CssClass="form-control user-satsno required" />
                </div>

                <div class="col-12 text-center mt-4">
                    <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-success btn-lg px-5" />
                </div>
            </div>
        </div>
    </div>
</div>

        <div class="container my-4">
              <noscript>
  <div class="alert alert-warning text-center">
    <strong>Warning!</strong> This form requires JavaScript to function properly. Please enable JavaScript in your browser.
  </div>
</noscript>
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">Student Registration Form</h4>
        </div>
        <div class="card-body bg-light">
            <div class="row">

                <!-- Example with icon -->
                <div class="col-md-6 mb-3">
                    <label class="required">Full Name</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <asp:TextBox ID="TextBox46" runat="server" CssClass="form-control user-name required" />
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="required">Father's Name</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user-tie"></i></span>
                        </div>
                        <asp:TextBox ID="TextBox47" runat="server" CssClass="form-control user-fathername required" />
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="required">Email</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        </div>
                        <asp:TextBox ID="TextBox48" runat="server" CssClass="form-control user-email required" />
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="required">Mobile Number</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        </div>
                        <asp:TextBox ID="TextBox49" runat="server" CssClass="form-control user-mobile required" />
                    </div>
                </div>

                <!-- Add more fields similarly -->

                <div class="col-12 text-center mt-4">
                    <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="btn btn-success btn-lg px-5" />
                </div>
            </div>
        </div>
    </div>
</div>

       

<div class="container my-4">
  <div class="card shadow-lg border-0">
    <div class="card-header bg-primary text-white text-center">
      <h4 class="mb-0">Student Registration Form</h4>
    </div>
    <div class="card-body bg-light">
      <div class="row">
        
        <!-- Full Name -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-user"></i></span>
            <asp:TextBox ID="TextBox50" runat="server" CssClass="form-control user-name required" />
          </div>
        </div>

        <!-- Father's Name -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-user-tie"></i></span>
            <asp:TextBox ID="TextBox51" runat="server" CssClass="form-control user-fathername required" />
          </div>
        </div>

        <!-- Mother's Name -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-female"></i></span>
            <asp:TextBox ID="TextBox52" runat="server" CssClass="form-control user-mothername required" />
          </div>
        </div>

        <!-- College Name -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-school"></i></span>
            <asp:TextBox ID="TextBox53" runat="server" CssClass="form-control user-clg required" />
          </div>
        </div>

        <!-- Qualification -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-graduation-cap"></i></span>
            <asp:TextBox ID="TextBox54" runat="server" CssClass="form-control user-qualification required" />
          </div>
        </div>

        <!-- SSLC Board -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-building"></i></span>
            <asp:TextBox ID="TextBox55" runat="server" CssClass="form-control user-boardsslc required" />
          </div>
        </div>

        <!-- PUC Board -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-building"></i></span>
            <asp:TextBox ID="TextBox56" runat="server" CssClass="form-control user-boardpuc required" />
          </div>
        </div>

        <!-- Mother Tongue -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-language"></i></span>
            <asp:TextBox ID="TextBox57" runat="server" CssClass="form-control user-mothertongue required" />
          </div>
        </div>

        <!-- Religion -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-praying-hands"></i></span>
            <asp:TextBox ID="TextBox58" runat="server" CssClass="form-control user-religion required" />
          </div>
        </div>

        <!-- SSLC Reg No -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
            <asp:TextBox ID="TextBox59" runat="server" CssClass="form-control user-regnosslc required" />
          </div>
        </div>

        <!-- PUC Reg No -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
            <asp:TextBox ID="TextBox60" runat="server" CssClass="form-control user-regnopuc required" />
          </div>
        </div>

        <!-- SATS No -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-clipboard-list"></i></span>
            <asp:TextBox ID="TextBox61" runat="server" CssClass="form-control user-satsno required" />
          </div>
        </div>

        <!-- Email -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
            <asp:TextBox ID="TextBox62" runat="server" CssClass="form-control user-email required" />
          </div>
        </div>

        <!-- Date of Birth -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
            <asp:TextBox ID="TextBox63" runat="server" CssClass="form-control user-dob required" />
          </div>
        </div>

        <!-- Mobile Number -->
        <div class="col-md-6 mb-4">
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-phone"></i></span>
            <asp:TextBox ID="TextBox64" runat="server" CssClass="form-control user-mobile required" />
          </div>
        </div>

        <!-- Submit Button -->
        <div class="col-12 text-center mt-5">
          <asp:Button ID="Button4" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg px-5" />
        </div>

      </div>
    </div>
  </div>
</div>







        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.querySelector('form');

                const fields = [
                    {
                        selector: 'input.user-name',
                        label: 'Name / ಹೆಸರು',
                        placeholder: 'Enter Your Name',
                        maxLength: 30,
                        errorMsg: 'Enter your valid name',
                        format: val => formatNameField(val),
                        validate: val => validateWordField(val)
                    },
                    {
                        selector: 'input.user-qualification',
                        label: 'Qualification / ಸ್ನಾತಕೋತ್ತರ',
                        placeholder: 'Enter your Qualification',
                        errorMsg: 'Only letters and spaces allowed.',
                        format: val => formatNameField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-religion',
                        label: 'Religion / ಧರ್ಮ',
                        placeholder: 'Enter Religion',
                        errorMsg: 'Only letters and spaces allowed.',
                        format: val => formatWordField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-mothertongue',
                        label: 'Mother Tongue / ಮಾತೃಭಾಷೆ',
                        placeholder: 'Enter Mother Tongue',
                        errorMsg: 'Only letters and spaces allowed.',
                        format: val => formatWordField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-clg',
                        label: 'College / ಕಾಲೇಜು',
                        placeholder: 'Enter College Name',
                        errorMsg: 'Only letters and spaces allowed.',
                        format: val => formatWordField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-mothername',
                        label: 'Mother Name / ತಾಯಿಯ ಹೆಸರು',
                        placeholder: 'Enter Mother Name',
                        errorMsg: 'Enter your mother name.',
                        format: val => formatNameField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-fathername',
                        label: 'Father Name / ತಂದೆಯ ಹೆಸರು',
                        placeholder: 'Enter Father Name',
                        errorMsg: 'Enter your father name.',
                        format: val => formatNameField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-boardpuc',
                        label: 'PUC Board Name / PUC ಮಂಡಳಿ ಹೆಸರು',
                        placeholder: 'Enter PUC Board Name',
                        errorMsg: 'Only letters and spaces allowed.',
                        format: val => formatWordField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-boardsslc',
                        label: 'SSLC Board Name / SSLC ಮಂಡಳಿ ಹೆಸರು',
                        placeholder: 'Enter SSLC Board Name',
                        errorMsg: 'Only letters and spaces allowed.',
                        format: val => formatWordField(val),
                        validate: val => validateWordField(val),
                    },
                    {
                        selector: 'input.user-mobile',
                        label: 'Mobile Number / ಮೊಬೈಲ್ ಸಂಖ್ಯೆ',
                        placeholder: '10-digit mobile number',
                        errorMsg: 'Enter exactly 10 digits.',
                        maxLength: 10,
                        format: val => val.replace(/\D/g, '').slice(0, 10),
                        validate: val => /^\d{10}$/.test(val),
                    },

                    {
                        selector: 'input.user-regnopuc',
                        label: 'PUC Registration (6 digits)',
                        placeholder: 'Enter 6-digit PUC Reg No',
                        errorMsg: 'Enter exactly 6 digits.',
                        maxLength: 6,
                        format: val => val.replace(/\D/g, '').slice(0, 6),
                        validate: val => /^\d{6}$/.test(val),
                    },
                    {
                        selector: 'input.user-regnosslc',
                        label: 'SSLC Registration (12 digits)',
                        placeholder: 'Enter 12-digit SSLC Reg No',
                        errorMsg: 'Enter exactly 12 digits.',
                        maxLength: 12,
                        format: val => val.replace(/\D/g, '').slice(0, 12),
                        validate: val => /^\d{12}$/.test(val),
                    },
                    {
                        selector: 'input.user-satsno',
                        label: 'SATS Number (6 digits)',
                        placeholder: 'Enter 6-digit SATS No',
                        errorMsg: 'Enter exactly 6 digits.',
                        maxLength: 6,
                        format: val => formatePinCode(val),
                        validate: val => /^\d{6}$/.test(val),
                    },
                    {
                        selector: 'input.user-pincode',
                        label: 'Pincode (6 digits)',
                        placeholder: 'Enter 6-digit pincode',
                        errorMsg: 'Enter exactly 6 digits.',
                        maxLength: 6,
                        format: val => val.replace(/\D/g, '').slice(0, 6),
                        validate: val => /^\d{6}$/.test(val),
                    },

                    {
                        selector: 'input.user-email',
                        label: 'Email / ಇಮೇಲ್',
                        placeholder: 'abc@gmail.com',
                        validate: val => /^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(val.trim()),
                        errorMsg: 'Enter a valid Gmail address.'
                    },

                    {
                        selector: 'input.user-dob',
                        label: 'Date of Birth / ಜನ್ಮ ದಿನಾಂಕ',
                        validate: val => {
                            if (!val) return false;
                            const d = new Date(val), t = new Date();
                            d.setHours(0, 0, 0, 0);
                            t.setHours(0, 0, 0, 0);
                            return d <= t;
                        },
                        setup: input => {
                            input.type = 'date';
                            input.min = '1900-01-01';
                            input.max = new Date().toISOString().split('T')[0];
                        },
                        errorMsg: 'DOB cannot be in the future.'
                    },

                ];

                // Setup & validation


                fields.forEach(f => {
                    document.querySelectorAll(f.selector).forEach(input => {
                        let grp = input.closest('.form-group');
                        if (!grp) {
                            grp = document.createElement('div');
                            grp.className = 'form-group';
                            input.parentNode.insertBefore(grp, input);
                            grp.appendChild(input);
                        }

                        if (!grp.querySelector('label')) {
                            const lab = document.createElement('label');
                            lab.classList.add('required');
                            lab.textContent = f.label;
                            grp.insertBefore(lab, input);
                        }

                        if (!grp.querySelector('.error-msg')) {
                            const err = document.createElement('div');
                            err.className = 'error-msg';
                            err.textContent = f.errorMsg;
                            grp.appendChild(err);
                        }

                        if (f.maxLength) input.maxLength = f.maxLength;
                        if (f.placeholder) input.placeholder = f.placeholder;
                        if (f.setup) f.setup(input);

                        // Only digits on keypress
                        if (['user-mobile', 'user-regnopuc', 'user-regnosslc', 'user-satsno', 'user-pincode']
                            .some(c => input.classList.contains(c))) {
                            input.addEventListener('keypress', e => {
                                if (!/[0-9]/.test(e.key)) e.preventDefault();
                            });
                        }

                        input.dataset.touched = "false";

                        input.addEventListener('input', () => {
                            if (f.format) input.value = f.format(input.value);
                        });

                        input.addEventListener('blur', () => {
                            input.dataset.touched = "true";
                            validate(input, f);
                        });

                        input.addEventListener('input', () => {
                            if (input.dataset.touched === "true") {
                                validate(input, f);
                            }
                        });

                    });
                });


                form.addEventListener('submit', e => {
                    e.preventDefault(); // Always prevent default form submission unless explicitly allowed

                    let allValid = true;
                    fields.forEach(f => {
                        document.querySelectorAll(f.selector).forEach(input => {
                            input.dataset.touched = "true";
                            if (!validate(input, f)) allValid = false;
                        });
                    });

                    const successAlert = document.getElementById('successAlert');
                    const errorAlert = document.getElementById('errorAlert');

                    if (!allValid) {
                        // ❌ Show error alert
                        errorAlert.classList.remove('d-none');
                        successAlert.classList.add('d-none');
                        errorAlert.scrollIntoView({ behavior: 'smooth' });

                        setTimeout(() => {
                            errorAlert.classList.add('d-none');
                        }, 3000);
                    } else {
                        // ✅ Show success alert
                        errorAlert.classList.add('d-none');
                        successAlert.classList.remove('d-none');
                        successAlert.scrollIntoView({ behavior: 'smooth' });

                        // ✅ Clear all form inputs
                        form.querySelectorAll('input[type="text"], input[type="email"], input[type="date"]').forEach(input => {
                            input.value = '';
                            input.classList.remove('is-invalid');
                            input.dataset.touched = "false";
                            const err = input.closest('.form-group')?.querySelector('.error-msg');
                            if (err) err.style.display = 'none';
                        });

                        setTimeout(() => {
                            successAlert.classList.add('d-none');
                        }, 3000);
                    }
                });

                function validate(input, f) {
                    const val = input.value.trim();
                    const valid = f.validate(val);
                    const touched = input.dataset.touched === "true";
                    input.classList.toggle('is-invalid', !valid && touched);
                    const err = input.closest('.form-group').querySelector('.error-msg');
                    err.style.display = (!valid && touched) ? 'block' : 'none';
                    return valid;
                }

                function formatNameField(val) {
                    return val.replace(/[^a-zA-Z. ]/g, '')
                        .replace(/\s+/g, ' ')
                        .replace(/\.{2,}/g, '.')
                        .replace(/^\./, '')
                        .replace(/(^\w|[\s.]\w)/g, c => c.toUpperCase());
                }

                function validateWordField(val) {
                    return /^[a-zA-Z ]+(\.?[a-zA-Z ]+)*$/.test(val.trim()) && val.trim() !== '';
                }

                function formatWordField(val) {
                    return val.replace(/[^a-zA-Z ]/g, '').replace(/\s+/g, ' ');
                }

                function formatePinCode(val) {
                    return val.replace(/\D/g, '').slice(0, 6);
                }

            });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>

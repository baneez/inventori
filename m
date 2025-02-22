<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INVENTORI JPJ (M)</title>
    <style>
        body {
            font-family: Nunito;
            background: linear-gradient(to bottom, #1E3A8A, #4A90E2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fdebd0;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        #logo {
            width: 100px;
            margin-bottom: 10px;
        }

        h2 {
            font-family: Nunito;
	    font-size: 22px;
            text-transform: uppercase;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            text-transform: uppercase;
        }

        select, input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            text-transform: uppercase;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #1E3A8A;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            text-transform: uppercase;
        }

        button:hover {
            background-color: #4A90E2;
        }

        .dashboard-link {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #1E3A8A;
            text-decoration: none;
            text-transform: uppercase;
        }

        .dashboard-link:hover {
            text-decoration: underline;
        }

        .footer-text {
            margin-top: 15px;
            font-size: 12px;
            color: gray;
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="https://i.postimg.cc/h4CXXqZd/JPJ-logo.png" alt="Logo" id="logo">
        <h2>REKOD INVENTORI JPJ (M)</h2>

        <form id="myForm">
            <label for="negeri">NEGERI:</label>
            <select id="negeri" onchange="updateLokasi()">
                <option value="">PILIH NEGERI</option>
                <option value="Johor">JOHOR</option>
                <option value="Kedah">KEDAH</option>
                <option value="Selangor">SELANGOR</option>
            </select>

            <label for="lokasi">LOKASI:</label>
            <select id="lokasi">
                <option value="">PILIH LOKASI</option>
            </select>

            <label for="dokumen">DOKUMEN:</label>
            <select id="dokumen">
                <option value="">PILIH DOKUMEN</option>
                <option value="Invoice">INVOICE</option>
                <option value="Receipt">RESIT</option>
            </select>

            <label for="transaksi">TRANSAKSI:</label>
            <select id="transaksi">
                <option value="">PILIH TRANSAKSI</option>
                <option value="Purchase">PEMBELIAN</option>
                <option value="Sale">JUALAN</option>
            </select>

            <label for="kuantiti">KUANTITI:</label>
            <input type="number" id="kuantiti">

            <label for="tarikh">TARIKH:</label>
            <input type="date" id="tarikh" value="">

            <label for="nama_penyedia">NAMA PENYEDIA:</label>
            <input type="text" id="nama_penyedia" oninput="convertToUpper(this)">

            <button type="button" onclick="validateForm()">SUBMIT</button>
        </form>

        <a href="your-dashboard-link" class="dashboard-link">DASHBOARD</a>

        <p class="footer-text">* Pastikan semua maklumat diisi dengan lengkap sebelum dihantar.</p>
    </div>

    <script>
        // NEGERI & LOKASI Mapping
        const lokasiData = {
            "Johor": ["JOHOR BAHRU", "MUAR", "BATU PAHAT"],
            "Kedah": ["ALOR SETAR", "SUNGAI PETANI", "KULIM"],
            "Selangor": ["SHAH ALAM", "PETALING JAYA", "KLANG"]
        };

        function updateLokasi() {
            const negeriSelect = document.getElementById("negeri");
            const lokasiSelect = document.getElementById("lokasi");
            const selectedNegeri = negeriSelect.value;

            // Reset lokasi dropdown
            lokasiSelect.innerHTML = '<option value="">PILIH LOKASI</option>';

            if (selectedNegeri && lokasiData[selectedNegeri]) {
                lokasiData[selectedNegeri].forEach(lokasi => {
                    let option = document.createElement("option");
                    option.value = lokasi;
                    option.textContent = lokasi;
                    lokasiSelect.appendChild(option);
                });
            }
        }

        // Auto-uppercase for NAMA PENYEDIA
        function convertToUpper(input) {
            input.value = input.value.toUpperCase();
        }

        // Set default date to today
        document.getElementById("tarikh").valueAsDate = new Date();

        // Form Validation
        function validateForm() {
            const negeri = document.getElementById("negeri").value;
            const lokasi = document.getElementById("lokasi").value;
            const dokumen = document.getElementById("dokumen").value;
            const transaksi = document.getElementById("transaksi").value;
            const kuantiti = document.getElementById("kuantiti").value;
            const tarikh = document.getElementById("tarikh").value;
            const namaPenyedia = document.getElementById("nama_penyedia").value;

            if (!negeri || !lokasi || !dokumen || !transaksi || !kuantiti || !tarikh || !namaPenyedia) {
                alert("DATA TIDAK LENGKAP");
                return;
            }

            alert("REKOD BERJAYA");
            document.getElementById("myForm").reset();
            document.getElementById("tarikh").valueAsDate = new Date(); // Reset date field
        }
    </script>

</body>
</html>

/* global jsPrintSetup */

var promises = [];
var DELAY_BETWEEN_EVERY_COPY = 1000;
var DELAY_BETWEEN_EVERY_PRINTER = 1000;

function makePromise(i, video) {
    promises[i] = new $.Deferred();
    // This event tells us video can be played all the way through, without stopping or buffering
    video.oncanplaythrough = function() {
        // Resolve the promise
        promises[i].resolve();
    };
}
// Pause all videos and create the promise array
$("video").each(function(index) {
    this.pause();
    makePromise(index, this);
});

// Wait for all promises to resolve then start playing
$.when.apply(null, promises).done(function() {
    $("video").each(function() {
        this.play();
    });
});

function printLoop(count) {
    for (var i = 0; i < count; i++) {
        document.getElementById("BillsShowForm:printedInfoBtn").click();
    }
}

//function printCashierLoop(count) {
//    for (var i = 0; i < count; i++) {
//        setTimeout("document.getElementById('BillsShowForm:printCashierBtn').click()", 100);
//    }
//}
//function printkitchenLoop(count) {
//    for (var i = 0; i < count; i++) {
//        setTimeout("document.getElementById('BillsShowForm:printKitchenBtn').click()", 100);
//    }
//}

function printCashierLoop(count) {
    for (var i = 0; i < count; i++) {
        setTimeout(function() {
            document.getElementById("BillsShowForm:printCashierBtn").click();
            i++;
        }, 300 * i);
    }
}

function printKitchenLoop(count) {
    for (var i = 0; i < count; i++) {
        setTimeout(function() {
            document
                .getElementById("BillsShowKitchenForm:printKitchenBtn")
                .click();
            i++;
        }, 300 * i);
    }
}

function sendToPrinterLoop(printer_name, printerType, count, i) {
    setTimeout(
        function() {
            sendToPrinter(printer_name, printerType);
            i++;
            if (i < count) {
                sendToPrinterLoop(printer_name, printerType, count, i);
            }
        },
        i === 0 ? 0 : DELAY_BETWEEN_EVERY_COPY
    );
}

function sendToPrinter(printer_name, printerType) {
    console.log(localStorage.getItem("jsPrint"));
    if (
        localStorage.getItem("jsPrint") != null &&
        localStorage.getItem("jsPrint") === "1"
    ) {
        var correctedPrinterName = printer_name;
        //    alert('correctedPrinterName =' + correctedPrinterName);
        jsPrintSetup.setPrinter(correctedPrinterName);
        // set top margins in millimeters
        jsPrintSetup.setOption("marginTop", 0);
        jsPrintSetup.setOption("marginBottom", 0);
        jsPrintSetup.setOption("marginLeft", 0);
        jsPrintSetup.setOption("marginRight", 0);
        //
        //                // set page header
        jsPrintSetup.setOption("headerStrLeft", "");
        jsPrintSetup.setOption("headerStrCenter", "");
        jsPrintSetup.setOption("headerStrRight", "");
        //
        //                // set empty page footer
        jsPrintSetup.setOption("footerStrLeft", "");
        jsPrintSetup.setOption("footerStrCenter", "");
        jsPrintSetup.setOption("footerStrRight", "");
        jsPrintSetup.setSilentPrint(true);
        jsPrintSetup.setShowPrintProgress(true);
        jsPrintSetup.printWindow(window.frames);
        return;
    } else {
        if (jspmWSStatus()) {
            //generate an image of HTML content through html2canvas utility
            html2canvas(document.getElementById("card"), { scale: 3 }).then(
                function(canvas) {
                    //Create a ClientPrintJob
                    var cpj = new JSPM.ClientPrintJob();
                    //Set Printer type (Refer to the help, there many of them!)

                    cpj.clientPrinter = new JSPM.InstalledPrinter(printer_name);

                    //Set content to print...
                    var b64Prefix = "data:image/png;base64,";
                    var imgBase64DataUri = canvas.toDataURL("image/png");
                    var imgBase64Content = imgBase64DataUri.substring(
                        b64Prefix.length,
                        imgBase64DataUri.length
                    );

                    var myImageFile = new JSPM.PrintFile(
                        imgBase64Content,
                        JSPM.FileSourceType.Base64,
                        "myFileToPrint.png",
                        1
                    );
                    //add file to print job
                    cpj.files.push(myImageFile);

                    //Send print job to printer!
                    cpj.sendToClient();
                }
            );
        }
    }
}

function printToCashier(printersArr) {
    for (var i = 0; i < printersArr.length; i++) {
        var currentPrinter = printersArr[i];
        if (currentPrinter.bill_type === 1) {
            var cashierPrinterName = currentPrinter.printer_name;
            var noOfCopies = currentPrinter.number_of_copies;
            sendToPrinterLoop(cashierPrinterName, 0, noOfCopies);
        }
    }
}

function distributePrintingTimeoutMain(printersArr) {
    var scannedPrinters = "";
    var uniquePrintersArr = new Array();
    for (var i = 0; i < printersArr.length; i++) {
        var currentPrinter = printersArr[i];
        var printer_name = currentPrinter.printer_name;
        var printerType = currentPrinter.bill_type;
        var printerNameType = printer_name + "," + printerType;

        if (scannedPrinters.indexOf(printerNameType) === -1) {
            scannedPrinters += printerNameType + "%%";
            uniquePrintersArr.push(currentPrinter);
        }
    }
    var i = 0;
    distributePrintingTimeout(printersArr, uniquePrintersArr, i);
}

function distributePrintingTimeout(printersArr, uniquePrintersArr, i) {
    setTimeout(function() {
        //  call a 600ms setTimeout when the loop is called
        distributePrinting(printersArr, uniquePrintersArr, i); //  your code here
        i++; //  increment the counter
        if (i < uniquePrintersArr.length) {
            //  if the counter < uniquePrintersArr.length, call the loop function
            distributePrintingTimeout(printersArr, uniquePrintersArr, i); //  ..  again which will trigger another
        } //  ..  setTimeout()
    }, DELAY_BETWEEN_EVERY_PRINTER);
}

function distributePrinting(printersArr, uniquePrintersArr, i) {
    var currentPrinter = uniquePrintersArr[i];
    var printer_name = currentPrinter.printer_name;
    var printerType = currentPrinter.bill_type;
    var noOfCopies = currentPrinter.number_of_copies;

    // in case of not included printer before
    var printerNameType = printer_name + "," + printerType;
    var printerMainIdStr = getPrinterMainIds(printerNameType, printersArr);
    //            var printerMainIdsStr = printerMainId.split(",")[printerMainId.split(",").length - 1];

    if (printerMainIdStr !== "" && printerMainIdStr !== null) {
        var allowToPrint = hideShowRelatedTypes(printerMainIdStr, printerType);
        if (allowToPrint) {
            sendToPrinterLoop(printer_name, printerType, noOfCopies, 0);
        }
    }
}

function getPrinterMainIds(printerNameType, printersArr) {
    var mainTypeIds = "";
    for (var i = 0; i < printersArr.length; i++) {
        var currentPrinter = printersArr[i];
        var printer_name = currentPrinter.printer_name;
        var printerType = currentPrinter.bill_type + "";
        if (
            printer_name === printerNameType.split(",")[0] &&
            printerType === printerNameType.split(",")[1]
        ) {
            mainTypeIds += currentPrinter.main_type_id + "%%";
        }
    }
    return mainTypeIds;
}

function hideShowRelatedTypes(printerMainIdsStr, printerType) {
    var assignedTable;
    var mainTypeIdIndex;
    // 1 = cashier printer / 2 = kitchen printer
    if (printerType === 1) {
        assignedTable = window.frames.contentWindow.document.getElementById(
            "BillsShowForm:cashierTable"
        ).firstChild.firstChild;
        mainTypeIdIndex = 4;
    } else {
        var iframe = $("#printFrame");
        var elmnt = $("#printFrame table");

        assignedTable = document.getElementById("kitchenTable");

        // parent.frames["display-frame"].document.getElementById("kitchenTable").firstChild.firstChild;
        mainTypeIdIndex = 0;
    }
    var noOfHiddenRows = 0;
    var tableLength = assignedTable.rows.length;
    for (var i = 1; assignedTable.rows[i]; i++) {
        var row = assignedTable.rows[i];
        var currentMainId = parseInt(row.cells[mainTypeIdIndex].textContent);
        var isExistMainId = false;
        for (var j = 0; j < printerMainIdsStr.split("%%").length; j++) {
            var id = printerMainIdsStr.split("%%")[j];

            if (parseInt(id) === parseInt(currentMainId)) {
                isExistMainId = true;
                break;
            }
        }
        if (isExistMainId) {
            row.style.display = "";
        } else {
            row.style.display = "none";
            noOfHiddenRows++;
        }
    }
    if (noOfHiddenRows >= tableLength - 1) {
        return false;
    } else {
        return true;
    }
}
function searchTable(userTable, searchInputUser) {
    // Get the value of the input and convert it to lowercase for case-insensitive search
    const searchTerm = document.getElementById(searchInputUser).value.toLowerCase();
    const table = document.getElementById(userTable);
    const rows = table.getElementsByTagName("tr");

    // Loop through table rows, excluding the header row
    for (let i = 1; i < rows.length; i++) {
        const cells = rows[i].getElementsByTagName("td");
        let rowContainsSearchTerm = false;

        // Check each cell in the row
        for (let j = 0; j < cells.length; j++) {
            const cellText = cells[j].textContent || cells[j].innerText;
            if (cellText.toLowerCase().indexOf(searchTerm) > -1) {
                rowContainsSearchTerm = true;
                break;
            }
        }

        // Toggle visibility based on search term presence
        rows[i].style.display = rowContainsSearchTerm ? "" : "none";
    }
}

function searchTable(plantTable, searchInputPlant) {
    // Get the value of the input and convert it to lowercase for case-insensitive search
    const searchTerm = document.getElementById(searchInputPlant).value.toLowerCase();
    const table = document.getElementById(plantTable);
    const rows = table.getElementsByTagName("tr");

    // Loop through table rows, excluding the header row
    for (let i = 1; i < rows.length; i++) {
        const cells = rows[i].getElementsByTagName("td");
        let rowContainsSearchTerm = false;

        // Check each cell in the row
        for (let j = 0; j < cells.length; j++) {
            const cellText = cells[j].textContent || cells[j].innerText;
            if (cellText.toLowerCase().indexOf(searchTerm) > -1) {
                rowContainsSearchTerm = true;
                break;
            }
        }

        // Toggle visibility based on search term presence
        rows[i].style.display = rowContainsSearchTerm ? "" : "none";
    }
}

function sortTable(userTable, criteria) {
    console.log("Sorting by:", criteria);
    const table = document.getElementById(userTable);
    const rows = Array.from(table.querySelectorAll("tbody tr")); // Select all rows in tbody

    rows.sort((a, b) => {
        if (criteria === "name") {
            // Sort alphabetically by name (first cell's text content)
            const nameA = a.cells[0].textContent.trim().toLowerCase();
            const nameB = b.cells[0].textContent.trim().toLowerCase();
            return nameA.localeCompare(nameB);
        } else if (criteria === "date") {
            // Sort by date if the data-date attribute exists
            const dateA = a.getAttribute("data-date") ? new Date(a.getAttribute("data-date")) : new Date(0);
            const dateB = b.getAttribute("data-date") ? new Date(b.getAttribute("data-date")) : new Date(0);
            return dateA - dateB; // Oldest to newest
        }
    });

    // Append sorted rows back to the table body
    const tbody = table.querySelector("tbody");
    tbody.innerHTML = ""; // Clear existing rows
    rows.forEach(row => tbody.appendChild(row)); // Add sorted rows
}

function sortTable(plantTable, criteria) {
    console.log("Sorting by:", criteria);
    const table = document.getElementById(plantTable);
    const rows = Array.from(table.querySelectorAll("tbody tr")); // Select all rows in tbody

    rows.sort((a, b) => {
        if (criteria === "name") {
            // Sort alphabetically by name (first cell's text content)
            const nameA = a.cells[0].textContent.trim().toLowerCase();
            const nameB = b.cells[0].textContent.trim().toLowerCase();
            return nameA.localeCompare(nameB);
        } else if (criteria === "date") {
            // Sort by date if the data-date attribute exists
            const dateA = a.getAttribute("data-date") ? new Date(a.getAttribute("data-date")) : new Date(0);
            const dateB = b.getAttribute("data-date") ? new Date(b.getAttribute("data-date")) : new Date(0);
            return dateA - dateB; // Oldest to newest
        } else if (criteria === "type") {
            // Sort alphabetically by type (second cell's text content)
            const typeA = a.cells[1].textContent.trim().toLowerCase();
            const typeB = b.cells[1].textContent.trim().toLowerCase();
            return typeA.localeCompare(typeB);
        }
    });

    // Clear and re-add sorted rows to the table body
    const tbody = table.querySelector("tbody");
    rows.forEach(row => tbody.appendChild(row));
}


function printTable() {
  // Get the original table
  const originalTable = document.getElementById('userTable');
  const rows = originalTable.querySelectorAll('tbody tr');

  // Create a new table for printing
  const printWindow = window.open('', '', 'height=600,width=800');
  printWindow.document.write('<html><head><title>User Info</title>');
  printWindow.document.write('<style>body{font-family: Arial, sans-serif;} table {width: 100%; border-collapse: collapse;} th, td {border: 1px solid #ddd; padding: 8px; text-align: left;} th {background-color: #f2f2f2;}</style>');
  printWindow.document.write('</head><body>');
  printWindow.document.write('<h2>User\'s Info</h2>');
  printWindow.document.write('<table><thead><tr><th>Name</th><th>Contact</th></tr></thead><tbody>');

  // Loop through each row in the original table and add only Name and Contact columns
  rows.forEach(row => {
    const cells = row.querySelectorAll('td');
    const name = cells[0].innerText; // Assuming "Name" is the first column
    const contact = cells[1].innerText; // Assuming "Contact" is the second column

    // Add rows to the print table
    printWindow.document.write(`<tr><td>${name}</td><td>${contact}</td></tr>`);
  });

  // Finish the table and close HTML tags
  printWindow.document.write('</tbody></table>');
  printWindow.document.write('</body></html>');

  // Print the new table
  printWindow.document.close();
  printWindow.print();

}



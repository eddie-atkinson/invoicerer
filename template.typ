
#let invoice_items = (
  (id: 1, date: "2025-08-01", employee: "John Doe", project: "Website Redesign", task: "Frontend Dev", description: "Design work for homepage", quantity: 8, hourly_rate: 100.00),
  (id: 2, date: "2025-08-02", employee: "Jane Smith", project: "App Development", task: "Backend Dev", description: "API integration", quantity: 5, hourly_rate: 120.00),
)
#let total = str("200.00")
#let gst = str("0.00")

#set document(author: "Your Name", title: "Invoice")
#set text(font: "Helvetica", size: 11pt)

#align(right)[
  #text(16pt, weight: "bold")[TAX INVOICE] \
  #text(12pt)[]
]
#line(length: 100%, stroke: black.darken(10%))

#v(1em)
#columns(2, gutter: 1em)[
  #block[
    Your Name \
    Your Street Address \
    Your City, Your State, Your Postcode \
    ABN:  \
    Your Email Address \
    Your Phone Number \
  ]
]

#v(1em)
#line(length: 100%, stroke: black.darken(10%))
#v(1em)




#v(1em)
#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  align: (left, left, left, left, left, left, right, right),
  inset: 5pt,
  [#text(weight: "bold")[ID]],
  [#text(weight: "bold")[Date]],
  [#text(weight: "bold")[Employee]],
  [#text(weight: "bold")[Project]],
  [#text(weight: "bold")[Task]],
  [#text(weight: "bold")[Description]],
  [#text(weight: "bold")[Quantity]],
  [#text(weight: "bold")[Hourly Rate]],
  
  ..invoice_items.map(item => (
    [#text(10pt)[#(item.id)]],
    [#text(10pt)[#(item.date)]],
    [#text(10pt)[#(item.employee)]],
    [#text(10pt)[#(item.project)]],
    [#text(10pt)[#(item.task)]],
    [#text(10pt)[#(item.description)]],
    [#text(10pt)[#(item.quantity)]],
    [#text(10pt)[\$#(str(item.hourly_rate))]],
  )).flatten(),
)

#align(right, [
  #v(1em)
  #table(
    columns: (2),  
    [#text(weight: "bold")[GST]], [#text()[\$0.00]],
    [#text(weight: "bold")[Total]], [#text()[\$#(total)]]
  )
]) 

#v(1em)
#line(length: 100%, stroke: black.darken(10%))
#v(1em)

#text(12pt, weight: "bold")[Remit to:] \
#text(10pt)[Bank Name: Your Bank] \
#text(10pt)[Account Name: Your Business Name] \
#text(10pt)[BSB: [Placeholder for BSB]] \
#text(10pt)[Account Number: [Placeholder for Account Number]] \
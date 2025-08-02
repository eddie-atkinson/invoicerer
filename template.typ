
#let invoice_items = ((id: "__export__.account_analytic_line_943_b72ec888", date: "2025-07-31", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Final touches to video design and fix minor visual errors in preparation for weekly update meeting. Start work on massaging API data for use in the condition tab and explore how current system renders condition", quantity: 2.25, hourly_rate: ""),
  (id: "__export__.account_analytic_line_942_26c467e1", date: "2025-07-30", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Call with Dara to discuss tweaks to the API surface that would assist with frontend integration. Including adding affected components to scan list response, vehicle centering and the ability to filter on tags. Also discussed how the backend could support sending timestamp offsets for issues to easily render videos in the frontend. On the back of this conversation the initial cut of the issues tab was completed", quantity: 3.0, hourly_rate: ""),
  (id: "__export__.account_analytic_line_941_6bbe1ec7", date: "2025-07-29", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Review pull request from Dara with initial Clerk authentication integration. Continue work setting up video streaming cards, looking at how video offsets can be used to play subsections of the main scan videos", quantity: 3.0, hourly_rate: ""),
  (id: "__export__.account_analytic_line_940_c7a6fa4b", date: "2025-07-27", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Start work on the issues tab design and video streaming implementation. Set up initial issues cards, wrangle the API return data to find issues and render rough UI for issue cards. Raise some queries with Dara regarding existing API surface for issues", quantity: 6.0, hourly_rate: ""),
  (id: "__export__.account_analytic_line_937_b24089d1", date: "2025-07-26", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Start work on the detailed scans pages. Set up initial responsive layout tabs for reusable mobile friendly design for the details, condition, issues, history and recordings view. Start work on on scan detail tab content", quantity: 6.0, hourly_rate: ""),
  (id: "__export__.account_analytic_line_944_d35be381", date: "2025-07-25", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "BZ Project Management (Aggregated)", description: "Weekly team catchup meeting. Demoed latest progress on front-end changes, discussed camera sourcing and supply chain challenges. Discussed possibility of client demo the following week - resolved to review after weekend to look at progress", quantity: 0.5, hourly_rate: ""),
  (id: "__export__.account_analytic_line_939_4ee0f830", date: "2025-07-24", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Update front-end designs following feedback from Brenton regarding terminology (scan processor -> leading hand), fix tyre SVG whose background colour did not respond to theme changes, tweak column ordering on the main scan table to put registration numbers further to the left", quantity: 1.0, hourly_rate: ""),
  (id: "__export__.account_analytic_line_912_28832d2a", date: "2025-07-22", employee: "Edward Atkinson", project: "P004 NOVA AI Newhaul", task: "AX  Layout Design and Feel", description: "Review Dara's pull request adding video streaming endpoints for scan and issue data and discuss strategy for front end to back end authentication: https://github.com/skunkresearchdev/rigscan_pro/pull/2", quantity: 0.5, hourly_rate: ""))

#let total = str("200.00")
#let gst = str("0.00")

#set document(title: "Invoice")
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
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: (left, left, left, left, right, right),
  inset: 5pt,
  [#text(weight: "bold")[Date]],
  [#text(weight: "bold")[Employee]],
  [#text(weight: "bold")[Project]],
  [#text(weight: "bold")[Task]],
  [#text(weight: "bold")[Description]],
  [#text(weight: "bold")[Quantity]],
  [#text(weight: "bold")[Hourly Rate]],
  
  ..invoice_items.map(item => (
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
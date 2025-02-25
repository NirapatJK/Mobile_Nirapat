const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

let items = [
    {name: "Mountain" ,image: "assets/images/view1.jpg" ,rate:"5.0" ,location: "Ubon, Thai"},
    {name: "Tree" ,image: "assets/images/view2.jpg" ,rate:"4.5" ,location: "Non, Thai"},
    {name: "Sky" ,image: "assets/images/view3.jpg" ,rate:"4.8" ,location: "Ubon, Thai"},
    {name: "Lake" ,image: "assets/images/view4.jpg" ,rate:"5.0" ,location: "Nakon, Thai"},
    {name: "Sea" ,image: "assets/images/view5.jpg" ,rate:"4.5" ,location: "Phuket, Thai"},
    {name: "Wood" ,image: "assets/images/view6.jpg" ,rate:"5.0" ,location: "Krabi, Thai"},
    {name: "Lake-Mountain" ,image: "assets/images/view7.jpg" ,rate:"5.0" ,location: "Ubon, Thai"},
    {name: "Land" ,image: "assets/images/view8.jpg" ,rate:"4.7" ,location: "Jun, Thai"},
    {name: "Sky-Land" ,image: "assets/images/view9.jpg" ,rate:"4.9" ,location: "Ubon, Thai"},
    {name: "Water" ,image: "assets/images/view10.jpg" ,rate:"5.0" ,location: "Nakon, Thai"},
    {name: "Farm" ,image: "assets/images/view11.jpg" ,rate:"4.6" ,location: "Phuket, Thai"},
    {name: "Lamp" ,image: "assets/images/view12.jpg" ,rate:"5.0" ,location: "Krabi, Thai"}
];

//Routing
//http://localhost:3000/items
app.get('/items', (req, res) => {
    res.json(items);
} );

app.get('/items/:name', (req, res) => {
    const item = items.find(i => i.name == req.params.name);
    res.json(item);
} );

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});
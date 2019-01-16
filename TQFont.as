class TQFont
{
    var name, size, color, bold, italic, backenable, backcolor;
    function TQFont()
    {
        name = "Arial";
        size = 16;
        color = 0;
        bold = false;
        italic = false;
        backenable = false;
        backcolor = 0;
    } // End of the function
    function LoadFromXML(ANode)
    {
        name = ANode.attributes.name;
        size = Number(ANode.attributes.size);
        color = Number(ANode.attributes.color);
        bold = Boolean(Number(ANode.attributes.bold));
        italic = Boolean(Number(ANode.attributes.italic));
        backenable = Boolean(Number(ANode.attributes.backenable));
        backcolor = Number(ANode.attributes.backcolor);
    } // End of the function
} // End of Class

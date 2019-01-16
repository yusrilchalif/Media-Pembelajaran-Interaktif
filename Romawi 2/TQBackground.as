class TQBackground
{
    var enable, border, fill, round, shadow;
    function TQBackground()
    {
        enable = true;
        border = 0;
        fill = 16777215;
        round = false;
        shadow = false;
    } // End of the function
    function LoadFromXML(ANode)
    {
        enable = Boolean(Number(ANode.attributes.enable));
        border = Number(ANode.attributes.border);
        fill = Number(ANode.attributes.fill);
        round = Boolean(Number(ANode.attributes.round));
        shadow = Boolean(Number(ANode.attributes.shadow));
    } // End of the function
} // End of Class

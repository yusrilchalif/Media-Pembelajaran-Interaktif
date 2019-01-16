class TQClickZone extends TQBase
{
    var userx, usery, scale, scaled, imginclude, img, imgbg, left, top, right, bottom;
    function TQClickZone(atype)
    {
        super(atype);
        userx = -1;
        usery = -1;
        scale = 1;
        scaled = false;
    } // End of the function
    function AddQuestion(ANode)
    {
        super.AddQuestion(ANode);
        imginclude = false;
        imgbg = img;
    } // End of the function
    function GetImagebg()
    {
        return (imgbg);
    } // End of the function
    function AddAnswer(ANode)
    {
        left = Number(ANode.attributes.left);
        top = Number(ANode.attributes.top);
        right = Number(ANode.attributes.right);
        bottom = Number(ANode.attributes.bottom);
        if (ANode.attributes.scaled == "y")
        {
            scaled = true;
        }
        else
        {
            scaled = false;
        } // end else if
    } // End of the function
    function SetResponse(Ax, Ay)
    {
        userx = Ax;
        usery = Ay;
    } // End of the function
    function UserResponse()
    {
        if (userx >= left * scale && userx <= right * scale)
        {
            if (usery >= top * scale && usery <= bottom * scale)
            {
                return (true);
            }
            else
            {
                return (false);
            } // end else if
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    function IsAnswered()
    {
        if (userx == -1 || usery == -1)
        {
            return (false);
        }
        else
        {
            return (true);
        } // end else if
    } // End of the function
    function GetResponseAsString()
    {
        var _loc3;
        _loc3 = "";
        _loc3 = userx / scale + _global.response_separator + usery / scale;
        return (_loc3);
    } // End of the function
    function GetResponseAsStringLMS()
    {
        var _loc2;
        if (this.UserResponse() == true)
        {
            _loc2 = "1";
        }
        else
        {
            _loc2 = "0";
        } // end else if
        return (_loc2);
    } // End of the function
    function GetCorrectResponseAsString()
    {
        var _loc3;
        _loc3 = "";
        _loc3 = _loc3 + left + _global.response_separator;
        _loc3 = _loc3 + top + _global.response_separator;
        _loc3 = _loc3 + right + _global.response_separator;
        _loc3 = _loc3 + bottom + _global.response_separator;
        return (_loc3);
    } // End of the function
    function GetCorrectResponseAsStringLMS()
    {
        var _loc1;
        _loc1 = "1";
        return (_loc1);
    } // End of the function
    function XMLAddAnswers(my_xml, node_answers)
    {
        var _loc2 = my_xml.createElement("userresponse");
        if (usery / scale != -1)
        {
            _loc2.attributes.y = usery / scale;
            _loc2.attributes.x = userx / scale;
        } // end if
        node_answers.parentNode.appendChild(_loc2);
        _loc2 = my_xml.createElement("answer");
        _loc2.attributes.bottom = bottom;
        _loc2.attributes.right = right;
        _loc2.attributes.top = top;
        _loc2.attributes.left = left;
        node_answers.appendChild(_loc2);
        return (true);
    } // End of the function
    var answer = "";
} // End of Class

var BDBridge = window.BDBridge || (function(){

    var self;
    var CONFIG = {
        BD_BRIDGE_OPEN : 1,
        BD_BRIDGE_ROOT : "http://qiao.baidu.com/v3/"
    };

    document.cookie = 'VERSION=2,0,0,0';
    
    if ((CONFIG.BD_BRIDGE_OPEN == 1) && (typeof window["BD_BRIDGE_LOADED"] == "undefined")) {
        window["BD_BRIDGE_LOADED"] = 1;
        var script = document.createElement("script");
        script.type="text/javascript";
        script.charset = "UTF-8";
        script.src = CONFIG.BD_BRIDGE_ROOT + "asset/js/bw.js?v=20141024";
        document.getElementsByTagName("head")[0].appendChild(script);
    }
    
    
    return self = {
    
        BD_BRIDGE_OPEN : CONFIG.BD_BRIDGE_OPEN,
        BD_BRIDGE_ROOT : CONFIG.BD_BRIDGE_ROOT,
        BD_BRIDGE_RCV_ROOT : "http://r.qiao.baidu.com/",
        BD_BRIDGE_DATA : {mainid : "120395459", SITE_ID : "fb49da32cbd439be7d94fb359e0bd328", siteid : "3966569", userName: 'tianzhancwq'},
        OPEN_MODULAR : 11111,
                BD_BRIDGE_SPECIAL :  [] ,
        
                BD_BRIDGE_STYLE_ITEM : 
        [        {
            pageid : "0",
            
           
                        BD_BRIDGE_GROUP:  [ '0' - 0 ] ,
            
            BD_BRIDGE_ICON_CONFIG : {
                iconlvtype : "2" - 0,
                background : {
                    color : "",
                    url   : "http://qiao.baidu.com/v3/res/iconbg/13.jpg",
                    bgcolor : "#ece6cd"
                },
                head : {
                    url    : "http://qiao.baidu.com/v3/res/iconhead/13.png",
                    width  : "100" - 0,
                    height : "53" - 0
                },
                button : {
                    color : "#f7bd84",
                    url   : "",
                    text  : "#f37d00"
                },
                flow     : "2" - 0,
                position : "5" - 0,
                special : "0"
            },
            BD_BRIDGE_INVITE_CONFIG : {
                on : "0" - 0,
                show : {
                    pos : "2" - 0,
                    width : "320" - 0,
                    height : "150" - 0,
                    font : "宋体",
                    fontsize : "12",
                    fontcolor : "#000000",
                    type : "0" - 0
                },
                background : {
                    color : "",
                    url   : "http://qiao.baidu.com/v3/res/invitebg/08.jpg"
                },
                head : {
                    show : "0" - 0,
                    size : "1" - 0,
                    url  : "http://qiao.baidu.com/v3/res/invitehead/16_big.jpg"
                },
                text   : "您好，需要新闻(软文)发布、微信推广、微博推广？请立即点击咨询营销推广经理。",
                button : "#206acf",
                mode   : "0" - 0,
                special : "0" - 0
            },
            BD_BRIDGE_INVITE : {
                inviteauto : "0" - 0,
                invitemanual : "0" - 0,
                invitetype   : "1" - 0,
                inviterepeat : "0" - 0,
                invitetime   : "1" - 0,
                invitedisaptype : "0" - 0,
                invitedisaptime : "20" - 0
            },
            BD_BRIDGE_WEBIM : {
                webimopentype : "0" - 0,
                webimbgcolor  : "#d5d5d5",
                floatposition : "0" - 0,
                floatChatName : "2" - 0,
                floatCustomname : ""
            },
                        BD_BRIDGE_PIGEON_SOUL : {
                disableMess     : "0" - 0,
                messType        : 1,
                messFloatType   : "0" - 0,
                language        : "0" - 0,
                position        : "0" - 0,
                backgroundColor : "#d23834",
                backgroundUrl       : "", 
                messItemName    : "1",
                messItemPhone   : "1",
                messItemAddress : "2",
                messItemEmail   : "0",
                extraMessItems  :  [ { key : "Q Q", necessity : 0 } ] 
            }
        }        ]
        
    }
   


})();

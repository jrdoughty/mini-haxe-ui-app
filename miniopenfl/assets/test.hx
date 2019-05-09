function setWidth() {
    container.width = widthValue.pos;
}

function setHeight() {
    container.height = heightValue.pos;
}

function getSelectedChild() {
    return container.findComponent(containerChild.selectedItem.childId);
}

function setSelectedChild(index) {
    containerChild.selectedIndex = index;
    updateChildValues();
}

function updateChildValues() {
    var child = getSelectedChild();
    
    // width
    if (child.percentWidth == null) {
        childWidthAsPercent.selected = false;
        childWidthValue.pos = child.width;
    } else {
        childWidthAsPercent.selected = true;
        childWidthValue.pos = child.percentWidth;
    }
    
    // height
    if (child.percentHeight == null) {
        childHeightAsPercent.selected = false;
        childHeightValue.pos = child.height;
    } else {
        childHeightAsPercent.selected = true;
        childHeightValue.pos = child.percentHeight;
    }
    
    // halign
    var halign = child.horizontalAlign;
    if (halign == null) {
        halign = "left";
    }
    for (i in 0...childHAlign.dataSource.size) {
        if (childHAlign.dataSource.get(i).halign == halign) {
            childHAlign.selectedIndex = i;
            break;
        }
    }
    
    // valign
    var valign = child.verticalAlign;
    if (valign == null) {
        valign = "top";
    }
    for (i in 0...childVAlign.dataSource.size) {
        if (childVAlign.dataSource.get(i).valign == valign) {
            childVAlign.selectedIndex = i;
            break;
        }
    }
    
    // visible
    childVisible.selected = !child.hidden;
}

function setChildWidth() {
    if (childWidthAsPercent.selected == false) {
        getSelectedChild().width = childWidthValue.pos;
    } else {
        getSelectedChild().percentWidth = childWidthValue.pos;
    }
}

function setChildWidthPercent() {
    if (childWidthAsPercent.selected == false) {
        getSelectedChild().percentWidth = null;
        getSelectedChild().width = childWidthValue.pos;
    } else {
        getSelectedChild().width = null;
        getSelectedChild().percentWidth = childWidthValue.pos;
    }
}

function setChildHeight() {
    if (childHeightAsPercent.selected == false) {
        getSelectedChild().height = childHeightValue.pos;
    } else {
        getSelectedChild().percentHeight = childHeightValue.pos;
    }
}

function setChildHeightPercent() {
    if (childHeightAsPercent.selected == false) {
        getSelectedChild().percentHeight = null;
        getSelectedChild().height = childHeightValue.pos;
    } else {
        getSelectedChild().height = null;
        getSelectedChild().percentHeight = childHeightValue.pos;
    }
}

function setChildHAlign() {
    getSelectedChild().horizontalAlign = childHAlign.selectedItem.halign;
}

function setChildVAlign() {
    getSelectedChild().verticalAlign = childVAlign.selectedItem.valign;
}

function setChildVisible() {
    getSelectedChild().hidden = !childVisible.selected;
}

widthValue.pos = container.width;
heightValue.pos = container.height;
// bit hacky, but works!
while (containerChild.dataSource.size > container.childComponents.length) {
    containerChild.dataSource.remove(containerChild.dataSource.get(containerChild.dataSource.size-1));
}

<grid columns="2">
    <label text="Width:" style="vertical-align:center;" />
    <hbox>
        <hslider width="100" id="widthValue" onchange="setWidth()" min="60" pos="300" max="300" />
        <checkbox text="Auto" verticalAlign="center" />
    </hbox>    
    
    <label text="Height:" style="vertical-align:center;" />
    <hbox>
        <hslider width="100" id="heightValue" onchange="setHeight()" min="60" pos="300" max="300"  />
        <checkbox text="Auto" verticalAlign="center" />
    </hbox>    

    <label text="Padding:" style="vertical-align:center;" />
    <hslider id="paddingValue" onchange="setHeight()" min="0" pos="5" max="30"  />
    
    <label id="spacingLabel" text="Spacing:" style="vertical-align:center;" />
    <hslider id="spacingValue" onchange="setHeight()" min="0" pos="5" max="30"  />
    
    <label id="clipLabel" text="Clip Content:" style="vertical-align:center;" />
    <checkbox id="clipValue" selected="true"  />
    
    <spacer height="50" />
    <spacer />
    
    <label text="Child:" style="vertical-align:center;" />
    <dropdown id="containerChild" text="Button 1" width="110" requireSelection="true" onchange="updateChildValues()">
        <data>
            <item value="Button 1" childId="button1" />
            <item value="Button 2" childId="button2" />
            <item value="Button 3" childId="button3" />
            <item value="Button 4" childId="button4" />
            <item value="Button 5" childId="button5" />
            <item value="Button 6" childId="button6" />
            <item value="Button 7" childId="button7" />
            <item value="Button 8" childId="button8" />
            <item value="Button 9" childId="button9" />
        </data>
    </dropdown>
    
    <label text="Width:" style="vertical-align:center;" />
    <hbox width="100%">
        <hslider width="100%" id="childWidthValue" min="10" pos="50" max="100" onchange="setChildWidth()" />
        <checkbox id="childWidthAsPercent" verticalAlign="center" onclick="setChildWidthPercent()" />
        <label text="%" verticalAlign="center" />
    </hbox>
    
    <label text="Height:" style="vertical-align:center;" />
    <hbox width="100%">
        <hslider width="100%" id="childHeightValue" min="10" pos="50" max="100" onchange="setChildHeight()" />
        <checkbox id="childHeightAsPercent" verticalAlign="center" onclick="setChildHeightPercent()" />
        <label text="%" verticalAlign="center" />
    </hbox>
    
    <label id="childHAlignLabel" text="HAlign:" style="vertical-align:center;" />
    <dropdown id="childHAlign" text="Left" width="110" onchange="setChildHAlign()">
        <data>
            <item value="Left" halign="left" />
            <item value="Center" halign="center" />
            <item value="Right" halign="right" />
        </data>
    </dropdown>
    
    <label text="VAlign:" style="vertical-align:center;" />
    <dropdown id="childVAlign" text="Top" width="110" onchange="setChildVAlign()">
        <data>
            <item value="Top" valign="top" />
            <item value="Center" valign="center" />
            <item value="Bottom" valign="bottom" />
        </data>
    </dropdown>
    
    <label text="Visible:" style="vertical-align:center;" />
    <checkbox id="childVisible" selected="true" onclick="setChildVisible()" />
</grid>    

<aura:application extends="force:slds">
    <lightning:layout >
        <lightning:layoutItem padding="around-small">
            <c:BoatSearch/>
        </lightning:layoutItem>
        <lightning:layoutItem padding="around-small">
            <lightning:layout verticalAlign="center" >
                <lightning:layoutItem flexibility="auto" padding="around-small">
                    <c:BoatDetails/>
                </lightning:layoutItem>
                <lightning:layoutItem flexibility="auto" padding="around-small">
                    <c:Map/>
                </lightning:layoutItem>
                
            </lightning:layout>
        </lightning:layoutItem>
    </lightning:layout>
</aura:application>
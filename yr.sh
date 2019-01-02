# Yuri's Revenge update
# Last commit with OBS version is b76be97a97f499f1b1b716418c36f95f8483d17a
function yrup {
        cdgo yr || exit
        hub pull origin master -q
        enlv=$(grep '^ENGINE\_VERSION' < mod.config | cut -d '"' -f 2) 
        enpv=$(grep "define engine\_version" < "$OBSH"/openra-yr/openra-yr.spec | cut -d ' ' -f 3) 
        mastn=$(comno) 
        specn=$(vere openra-yr) 
        comm=$(loge) 
        specm=$(come openra-yr) 

        if [[ "$specn" == "$mastn" ]]
        then
                printf "OpenRA Yuri's Revenge is up-to-date!\n"
        else
                sed -i -e "s/$specn/$mastn/g" "$OBSH"/openra-yr/{openra-yr.spec,PKGBUILD}
                sed -i -e "s/$specm/$comm/g" "$OBSH"/openra-yr/{openra-yr.spec,PKGBUILD}
                if ! [[ "$enpv" == "$enlv" ]]
                then
                        sed -i -e "s/$enpv/$enlv/g" "$OBSH"/openra-yr/{openra-yr.spec,PKGBUILD}
                        make clean || exit
                        make || exit
                        tar czvf "$OBSH"/openra-yr/engine-"${enlv}".tar.gz engine
                        cdobsh openra-yr || exit
                        osc rm engine-"${enpv}".tar.gz
                        osc add engine-"${enlv}".tar.gz
                        cd - || exit
                fi
                cdobsh openra-yr || exit
                osc ci -m "Bumping $specn->$mastn"
        fi

	# A larger func was used before eb723d4af07bf2a72038a938525f18cd98df2699
	mod-build yr
}

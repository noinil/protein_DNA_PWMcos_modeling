mol new pro.pdb

set num_bp 51
set num_pro_rep 20
set shift_coor {40 40 0}


set pro [atomselect top all]

proc geom_center {selection} {
    set gc [veczero]
    foreach coord [$selection get {x y z}] {
        set gc [vecadd $gc $coord]
    }
    return [vecscale [expr 1.0 /[$selection num]] $gc]
}


# move protein step by step...
mol new dna0.pdb
set nuc_sel 0
set pro_move_step [expr $num_bp / $num_pro_rep]
for {set i 0} {$i < 20} {incr i} {
    puts " --------------------------------------- "
    set nuc_sel [expr $nuc_sel + $pro_move_step]
    set dna_atom_tmp [atomselect 1 "residue $nuc_sel"]
    set dna_atmp_coor [lindex [$dna_atom_tmp get {x y z}] 0]
    set target_coor [vecadd $dna_atmp_coor $shift_coor]
    set real_shift [vecsub $target_coor [geom_center $pro]]
    $pro moveby $real_shift

    # --------- perform a slight trans ---------
    set angle [expr {round(rand() * 360)} ]
    put $angle
    $pro move [trans center [geom_center $pro] axis z $angle]

    $pro writepdb pro_init_$i.pdb
}

exit

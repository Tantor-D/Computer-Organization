/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000514072582_3383896982_init();
    work_m_00000000003474969252_3866583278_init();
    work_m_00000000000908026695_3037777339_init();
    work_m_00000000003678657892_1785967555_init();
    work_m_00000000003628255807_4127636709_init();
    work_m_00000000002708121539_1579609468_init();
    work_m_00000000000994443445_3146453351_init();
    work_m_00000000002307376093_2725559894_init();
    work_m_00000000003586182716_1672990010_init();
    work_m_00000000002369043015_3881302476_init();
    work_m_00000000001847050952_2400151419_init();
    work_m_00000000002946960123_0160127878_init();
    work_m_00000000000778623227_1396100487_init();
    work_m_00000000002133301472_1941408880_init();
    work_m_00000000000315799836_1292031434_init();
    work_m_00000000000303327777_3877310806_init();
    work_m_00000000001292392995_1131260308_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001292392995_1131260308");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}

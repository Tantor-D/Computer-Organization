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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/software_data/ISE_data/P4/DM.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1024, 0};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {1, 0};
static const char *ng6 = "@%h: *%h <= %h";



static void Cont_15_0(char *t0)
{
    char t5[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 3784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 2704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2704);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2704);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t13 = (t0 + 1824U);
    t14 = *((char **)t13);
    memset(t12, 0, 8);
    t13 = (t12 + 4);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = (t16 >> 2);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 2);
    *((unsigned int *)t13) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 1023U);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 1023U);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t12, 10, 2);
    t22 = (t0 + 4448);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t5, 8);
    xsi_driver_vfirst_trans(t22, 0, 31);
    t27 = (t0 + 4352);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Always_16_1(char *t0)
{
    char t6[8];
    char t32[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    int t42;
    int t43;
    int t44;

LAB0:    t1 = (t0 + 4032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 4368);
    *((int *)t2) = 1;
    t3 = (t0 + 4064);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(16, ng0);

LAB5:    xsi_set_current_line(17, ng0);
    t4 = (t0 + 1664U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1504U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB24;

LAB21:    if (t18 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t6) = 1;

LAB24:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB25;

LAB26:
LAB27:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(17, ng0);

LAB13:    t28 = (t0 + 280);
    xsi_vlog_namedbase_setdisablestate(t28, &&LAB14);
    t29 = (t0 + 3840);
    xsi_vlog_namedbase_pushprocess(t28, t29);

LAB15:    xsi_set_current_line(19, ng0);
    xsi_set_current_line(19, ng0);
    t30 = ((char*)((ng2)));
    t31 = (t0 + 2864);
    xsi_vlogvar_assign_value(t31, t30, 0, 0, 32);

LAB16:    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB17;

LAB18:    t2 = (t0 + 280);
    xsi_vlog_namedbase_popprocess(t2);

LAB14:    t3 = (t0 + 3840);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB12;

LAB17:    xsi_set_current_line(20, ng0);
    t8 = ((char*)((ng4)));
    t21 = (t0 + 2704);
    t22 = (t0 + 2704);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t30 = (t0 + 2704);
    t31 = (t30 + 64U);
    t34 = *((char **)t31);
    t35 = (t0 + 2864);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    xsi_vlog_generic_convert_array_indices(t32, t33, t29, t34, 2, 1, t37, 32, 1);
    t38 = (t32 + 4);
    t14 = *((unsigned int *)t38);
    t39 = (!(t14));
    t40 = (t33 + 4);
    t15 = *((unsigned int *)t40);
    t41 = (!(t15));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 2864);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB16;

LAB19:    t16 = *((unsigned int *)t32);
    t17 = *((unsigned int *)t33);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t21, t8, 0, *((unsigned int *)t33), t44, 0LL);
    goto LAB20;

LAB23:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(22, ng0);

LAB28:    xsi_set_current_line(23, ng0);
    t21 = (t0 + 2144U);
    t22 = *((char **)t21);
    t21 = (t0 + 1824U);
    t28 = *((char **)t21);
    t21 = (t0 + 1984U);
    t29 = *((char **)t21);
    xsi_vlogfile_write(1, 0, 0, ng6, 4, t0, (char)118, t22, 32, (char)118, t28, 32, (char)118, t29, 32);
    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1984U);
    t3 = *((char **)t2);
    t2 = (t0 + 2704);
    t4 = (t0 + 2704);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = (t0 + 2704);
    t21 = (t8 + 64U);
    t22 = *((char **)t21);
    t28 = (t0 + 1824U);
    t29 = *((char **)t28);
    memset(t33, 0, 8);
    t28 = (t33 + 4);
    t30 = (t29 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (t9 >> 2);
    *((unsigned int *)t33) = t10;
    t11 = *((unsigned int *)t30);
    t12 = (t11 >> 2);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t13 & 1023U);
    t14 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t14 & 1023U);
    xsi_vlog_generic_convert_array_indices(t6, t32, t7, t22, 2, 1, t33, 10, 2);
    t31 = (t6 + 4);
    t15 = *((unsigned int *)t31);
    t39 = (!(t15));
    t34 = (t32 + 4);
    t16 = *((unsigned int *)t34);
    t41 = (!(t16));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB29;

LAB30:    goto LAB27;

LAB29:    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t32);
    t43 = (t17 - t18);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t32), t44, 0LL);
    goto LAB30;

}


extern void work_m_00000000003697992705_2924402094_init()
{
	static char *pe[] = {(void *)Cont_15_0,(void *)Always_16_1};
	xsi_register_didat("work_m_00000000003697992705_2924402094", "isim/tb_mips_isim_beh.exe.sim/work/m_00000000003697992705_2924402094.didat");
	xsi_register_executes(pe);
}

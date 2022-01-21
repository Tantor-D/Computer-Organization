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
static const char *ng0 = "E:/software_data/ISE_data/P6/mdu.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {5, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {10, 0};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {4U, 0U};
static unsigned int ng9[] = {5U, 0U};



static void Cont_22_0(char *t0)
{
    char t6[8];
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
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
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
        goto LAB5;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB7:    t22 = (t0 + 4312);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t6 + 4);
    t30 = *((unsigned int *)t6);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0);
    t35 = (t0 + 4216);
    *((int *)t35) = 1;

LAB1:    return;
LAB5:    *((unsigned int *)t6) = 1;
    goto LAB7;

LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

}

static void Always_24_1(char *t0)
{
    char t14[16];
    char t15[16];
    char t17[16];
    char t19[8];
    char t20[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t16;
    char *t18;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 4232);
    *((int *)t2) = 1;
    t3 = (t0 + 3928);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(24, ng0);

LAB5:    xsi_set_current_line(25, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng8)));
    memset(t19, 0, 8);
    t4 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t11);
    t22 = (t9 ^ t10);
    t23 = (t8 | t22);
    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t11);
    t26 = (t24 | t25);
    t27 = (~(t26));
    t28 = (t23 & t27);
    if (t28 != 0)
        goto LAB31;

LAB28:    if (t26 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t19) = 1;

LAB31:    t16 = (t19 + 4);
    t29 = *((unsigned int *)t16);
    t30 = (~(t29));
    t31 = *((unsigned int *)t19);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t19, 0, 8);
    t4 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t11);
    t22 = (t9 ^ t10);
    t23 = (t8 | t22);
    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t11);
    t26 = (t24 | t25);
    t27 = (~(t26));
    t28 = (t23 & t27);
    if (t28 != 0)
        goto LAB38;

LAB35:    if (t26 != 0)
        goto LAB37;

LAB36:    *((unsigned int *)t19) = 1;

LAB38:    t16 = (t19 + 4);
    t29 = *((unsigned int *)t16);
    t30 = (~(t29));
    t31 = *((unsigned int *)t19);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = ((char*)((ng1)));
    memset(t19, 0, 8);
    t12 = (t4 + 4);
    t16 = (t11 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t12);
    t10 = *((unsigned int *)t16);
    t22 = (t9 ^ t10);
    t23 = (t8 | t22);
    t24 = *((unsigned int *)t12);
    t25 = *((unsigned int *)t16);
    t26 = (t24 | t25);
    t27 = (~(t26));
    t28 = (t23 & t27);
    if (t28 != 0)
        goto LAB43;

LAB42:    if (t26 != 0)
        goto LAB44;

LAB45:    t34 = (t19 + 4);
    t29 = *((unsigned int *)t34);
    t30 = (~(t29));
    t31 = *((unsigned int *)t19);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB46;

LAB47:
LAB48:
LAB41:
LAB34:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(25, ng0);

LAB9:    xsi_set_current_line(26, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 2408);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    xsi_set_current_line(27, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(28, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB8;

LAB10:    xsi_set_current_line(30, ng0);

LAB13:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);

LAB14:    t4 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t13 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB12;

LAB15:    xsi_set_current_line(32, ng0);

LAB24:    xsi_set_current_line(33, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    xsi_vlogtype_sign_extend(t14, 64, t12, 32);
    t11 = (t0 + 1528U);
    t16 = *((char **)t11);
    xsi_vlogtype_sign_extend(t15, 64, t16, 32);
    xsi_vlog_signed_multiply(t17, 64, t14, 64, t15, 64);
    t11 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t11, t17, 0, 0, 32, 0LL);
    t18 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t18, t17, 32, 0, 32, 0LL);
    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(37, ng0);

LAB25:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 1528U);
    t11 = *((char **)t3);
    xsi_vlog_unsigned_multiply(t14, 64, t4, 32, t11, 32);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t14, 0, 0, 32, 0LL);
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t14, 32, 0, 32, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(42, ng0);

LAB26:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 1528U);
    t11 = *((char **)t3);
    memset(t21, 0, 8);
    xsi_vlog_signed_divide(t21, 32, t4, 32, t11, 32);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t21, 0, 0, 32, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1528U);
    t4 = *((char **)t2);
    memset(t21, 0, 8);
    xsi_vlog_signed_mod(t21, 32, t3, 32, t4, 32);
    t2 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t2, t21, 0, 0, 32, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB23;

LAB21:    xsi_set_current_line(48, ng0);

LAB27:    xsi_set_current_line(49, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 1528U);
    t11 = *((char **)t3);
    memset(t19, 0, 8);
    xsi_vlog_unsigned_divide(t19, 32, t4, 32, t11, 32);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t19, 0, 0, 32, 0LL);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1528U);
    t4 = *((char **)t2);
    memset(t19, 0, 8);
    xsi_vlog_unsigned_mod(t19, 32, t3, 32, t4, 32);
    t2 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t2, t19, 0, 0, 32, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB23;

LAB30:    t12 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB31;

LAB32:    xsi_set_current_line(61, ng0);
    t18 = (t0 + 1368U);
    t34 = *((char **)t18);
    t18 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t18, t34, 0, 0, 32, 0LL);
    goto LAB34;

LAB37:    t12 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB38;

LAB39:    xsi_set_current_line(62, ng0);
    t18 = (t0 + 1368U);
    t34 = *((char **)t18);
    t18 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t18, t34, 0, 0, 32, 0LL);
    goto LAB41;

LAB43:    *((unsigned int *)t19) = 1;
    goto LAB45;

LAB44:    t18 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB45;

LAB46:    xsi_set_current_line(64, ng0);
    t35 = (t0 + 2728);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = ((char*)((ng4)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_minus(t20, 4, t37, 4, t38, 4);
    t39 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t39, t20, 0, 0, 4, 0LL);
    goto LAB48;

}


extern void work_m_00000000003586182716_1672990010_init()
{
	static char *pe[] = {(void *)Cont_22_0,(void *)Always_24_1};
	xsi_register_didat("work_m_00000000003586182716_1672990010", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000003586182716_1672990010.didat");
	xsi_register_executes(pe);
}

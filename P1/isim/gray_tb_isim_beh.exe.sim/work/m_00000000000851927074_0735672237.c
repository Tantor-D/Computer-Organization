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
static const char *ng0 = "F:/sophomore/teaching assistant/ISE/P1/gray.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {3U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {6U, 0U};
static unsigned int ng6[] = {7U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {4U, 0U};



static void Initial_20_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(20, ng0);

LAB2:    xsi_set_current_line(21, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(22, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 3);

LAB1:    return;
}

static void Always_24_1(char *t0)
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
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    int t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 3416);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(24, ng0);

LAB5:    xsi_set_current_line(25, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
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

LAB11:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
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
        goto LAB17;

LAB14:    if (t18 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t6) = 1;

LAB17:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB18;

LAB19:
LAB20:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(25, ng0);

LAB13:    xsi_set_current_line(26, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 3, 0LL);
    xsi_set_current_line(27, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB16:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(29, ng0);

LAB21:    xsi_set_current_line(30, ng0);
    t21 = (t0 + 1768);
    t22 = (t21 + 56U);
    t28 = *((char **)t22);

LAB22:    t29 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t29, 3);
    if (t30 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng2)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng3)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng6)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng7)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng8)));
    t30 = xsi_vlog_unsigned_case_compare(t28, 3, t2, 3);
    if (t30 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB20;

LAB23:    xsi_set_current_line(31, ng0);
    t31 = ((char*)((ng2)));
    t32 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t32, t31, 0, 0, 3, 0LL);
    goto LAB39;

LAB25:    xsi_set_current_line(32, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB39;

LAB27:    xsi_set_current_line(33, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB39;

LAB29:    xsi_set_current_line(34, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB39;

LAB31:    xsi_set_current_line(35, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB39;

LAB33:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB39;

LAB35:    xsi_set_current_line(37, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB39;

LAB37:    xsi_set_current_line(38, ng0);

LAB40:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB39;

}


extern void work_m_00000000000851927074_0735672237_init()
{
	static char *pe[] = {(void *)Initial_20_0,(void *)Always_24_1};
	xsi_register_didat("work_m_00000000000851927074_0735672237", "isim/gray_tb_isim_beh.exe.sim/work/m_00000000000851927074_0735672237.didat");
	xsi_register_executes(pe);
}

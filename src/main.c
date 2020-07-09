/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmoreau <vmoreau@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/14 18:03:55 by vmoreau           #+#    #+#             */
/*   Updated: 2020/07/09 12:38:02 by vmoreau          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

static void test_strlen()
{
	printf("\n%sTest FT_STRLEN :\n%s", CYAN, NC);
	char *str = "|Test FT_STRLEN|";
	printf("Me: %zu | Base : %zu\n", ft_strlen(str), strlen(str));
	printf("\n%s#--------------------#%s\n\n", RED, NC);
}

static void test_write()
{
	int ret = 0;
	char *str = "|Test FT_WRITE|";
	printf("%sTest FT_WRITE :%s\n", CYAN, NC);
	ft_write(1, "Me:   ", 6);
	ret = ft_write(1, str, ft_strlen(str));
	printf("\nReturn = %d ", ret);
	printf("Errno :%s %s %s\n\n",RED, strerror(errno), NC);
	write(1, "Base: ", 6);
	ret = write(1, str, strlen(str));
	printf("\nReturn = %d ", ret);
	printf("Errno :%s %s %s\n",RED, strerror(errno), NC);
	printf("\n%s#--------------------#%s\n\n", RED, NC);
}

static void test_read()
{
	printf("%sTest FT_READ :\n%s", CYAN, NC);
	int fd = open("./text", O_RDONLY);
	int fd2 = open("./text", O_RDONLY);
	int ret = 1;
	int nb_read = 5;
	char stock[nb_read];
	printf("Me   :\n");
	while (ret > 0)
	{
		ret = ft_read(fd, stock, nb_read);
		if (ret > -1)
			printf("%s", stock);
	}
	printf("\nReturn : %d ", ret);
	printf("Errno :%s %s %s",RED, strerror(errno), NC);
	ret = 1;
	printf("\n\nBase :\n");
	while (ret > 0)
	{
		ret = ft_read(fd2, stock, nb_read);
		if (ret > -1)
			printf("%s", stock);
	}
	printf("\nReturn : %d ", ret);
	printf("Errno :%s %s %s",RED, strerror(errno), NC);
	printf("\n\n%s#--------------------#%s\n\n", RED, NC);
}

static void test_strcpy()
{
	printf("%sTest FT_STRCPY :\n%s", CYAN, NC);
	char dst[100] = "|Dest base string|";
	char dstb[100] = "|Dest base string|";
	char *src = "|Test FT_STRCPY|";
	printf("Me:\nNo Modif dest %s\n", dst);
	printf("Return:       %s\nModif Dest:   %s\n\n", ft_strcpy(dst, src), dst);
	printf("Base:\nNo Modif dest %s\n", dstb);
	printf("Return:       %s\nModif Dest:   %s\n", strcpy(dstb, src), dstb);
	printf("\n%s#--------------------#%s\n\n", RED, NC);
}

static void test_strcmp()
{
	printf("%sTest FT_STRCMP :\n%s", CYAN, NC);
	char *s1 = "abcet";
	char *s2 = "abcef";
	printf("Me: %d  | Base: %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
	printf("Me: %d | Base: %d\n", ft_strcmp(s2, s1), strcmp(s2, s1));
	printf("Me: %d  | Base: %d\n", ft_strcmp(s1, s1), strcmp(s1, s1));
	printf("\n%s#--------------------#%s\n\n", RED, NC);
}

static void test_strdup()
{
	printf("%sTest FT_STRDUP :\n%s", CYAN, NC);
	char *dup;
	char *dupb;
	char *str = "|Test FT_STRDUP|";
	dup = ft_strdup(str);
	dupb = strdup(str);
	printf("Me:   %s\n", dup);
	printf("Base: %s\n", dupb);
	printf("\n%s#--------------------#%s\n", RED, NC);
}

int main()
{
	printf("%s#--------------------#%s\n", RED, NC);
	test_strlen();
	test_write();
	test_read();
	test_strcpy();
	test_strcmp();
	test_strdup();
	return (0);
}

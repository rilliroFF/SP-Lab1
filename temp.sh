#!/bin/bash
echo "Пирожков Кирилл, гр. 710-1"
echo "Поиск файла"
echo "Данный скрипт предназназначен для поиска файла в каталоге по имени или размеру файла."

while [ "1" == "1" ]
do
	
	
	cond=0
	while [ "$cond" -ne 1 ]
	do
	
	echo "Выберите действие: "
	echo "1) Поиск по имени файла"
	echo "2) Поиск по размеру файла"
	echo "3) Завершить работу программы"
	read action
	if [[ "$action" == "1" || "$action" == "2" ]]; then
		cond=1
	elif [[ "$action" == "3" ]]; then
		exit 0
	else
		echo "Такого команды не существет. Попроуйте еще раз!"
	fi
	done	
	
	cond=0
	while [ "$cond" -ne 1 ]
	do
	echo "Введите каталог, в котором нужно найти файл: "
	read directory 
	if test -d $directory ; then
		cond=1
	else
		echo "Такого католога не существует. Попробуйте еще раз!"
	fi
	done
	
	if [[ "$action" == "1" ]]
	then
		cond=0
		while [ "$cond" -ne 1 ]
		do
		echo "Введите имя файла: "
		read namefile
		if [[ "$namefile" == "" ]]; then
			echo "Вы не ввели имя файла!"
		else
			cond=1
		fi
		done
		echo "Файлы с именем $namefile: "
		result=$(find $directory -type f -name "$namefile" -print)
		if [[ "$result" == "" ]]; then
			echo "Не было найдено таких файлов"
		else
			echo "$result"
		fi
		echo " "
	elif [[ "$action" == "2" ]]
	then
		cond=0
		while [ "$cond" -ne 1 ]
		do
		echo "Введите минимальный размер файла в Мб: "
		read minsize
		if [[ -n ${minsize//[0-9]/} ]]; then
			echo "Введите численное значение!"
		elif [[ "$minsize" == "" ]]; then
			echo "Вы не ввели размер файла!"
		else
			cond=1
		fi
		done
		echo "Файлы с размером больше чем $minsize: "
		find $directory -type f -size +${minsize}M -print
		echo " "
	else
		echo "Некоректный номер действия!"
	fi
	
echo "Работа программы завершена. Хотите продолжить искать файлы? Введите y для продолжения."
read yn
if [ "$yn" = "y" ]
then continue
else break
fi
done

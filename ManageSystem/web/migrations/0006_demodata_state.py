# Generated by Django 3.1 on 2020-12-19 10:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0005_excuterecord'),
    ]

    operations = [
        migrations.AddField(
            model_name='demodata',
            name='state',
            field=models.IntegerField(default=0),
        ),
    ]

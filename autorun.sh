#!/bin/bash
mysqladmin -u root password pointone
mysqladmin -u root -ppointone create references_development
mysql references_development --user=root -ppointone < user.sql
rake db:migrate:reset
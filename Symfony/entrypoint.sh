#!/bin/bash
composer install --no-interaction --prefer-dist --no-progress
until php bin/console doctrine:query:sql "SELECT 1" >/dev/null 2>&1; do
	sleep 2
done

php bin/console doctrine:migrations:sync-metadata-storage --no-interaction
php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration

exec apache2-foreground
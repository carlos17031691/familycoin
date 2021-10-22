// Copyright (c) 2011-2014 The Familycoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FAMILYCOIN_QT_FAMILYCOINADDRESSVALIDATOR_H
#define FAMILYCOIN_QT_FAMILYCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class FamilycoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FamilycoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Familycoin address widget validator, checks for a valid familycoin address.
 */
class FamilycoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FamilycoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // FAMILYCOIN_QT_FAMILYCOINADDRESSVALIDATOR_H
